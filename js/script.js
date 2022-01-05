class Api{
    constructor(url, headers){
        this._url = url
        this._headers = headers
    }


    getItems(){
        return fetch(this._url,{
            method: 'GET',
            headers: this._headers
        }).then((res) => {
            return this._processResult(res, 'Ошибка при получении данных')
        })
    }

    deleteItem(id){
        return fetch(`${this._url}/${id}`,{
            method: 'DELETE',
            headers: this._headers
        }).then((res) => {
            return this._processResult(res, 'Ошибка при удалении данных')
        })
    }

    createItem(data){
        return fetch(`${this._url}/`,{
            method: 'POST',
            headers: this._headers,
            body: JSON.stringify(data)
        }).then((res) => {
            return this._processResult(res, 'Ошибка при добавлении записи')
        })
    }

    updateItem(id,data){
        return fetch(`${this._url}/${id}`,{
            method: 'PUT',
            headers: this._headers,
            body: JSON.stringify(data)
        }).then((res) => {
            return this._processResult(res, 'Ошибка при редактировании записи')
        })
    }

    _processResult(res, errorText){
        if (res.ok) return res.json()
        alert(errorText)
        return Promise.reject(errorText)
    }
}

class Form{
    constructor(element){
        this._element = element
    }

    init(submitHandler, values){
        this.closeForm()
        this._submitHandler = submitHandler
        this._element.addEventListener('submit', this._submitHandler)
    
        if(values){
            Object.keys(values).forEach((name) => {
                this._element.querySelector(`[name=${name}]`).value = values[name]
            })
        }
    }

    closeForm(){
        this._element.reset()
        this._element.removeEventListener('submit', this._submitHandler)
        this._submitHandler = null
    }
}
const $classmates = document.querySelector('.classmates')
const $classmatesTemplate = document.querySelector('#classmatesTemplate').content
const $popup = document.querySelector('#studentPopup')
const $addButton = document.querySelector('.add-button')
const $popupCloseButton = document.querySelector('.popup__close')
const classmatesApi = new Api('http://localhost:3000/students', {'Content-Type': 'application/json'})
const studentForm = new Form(document.querySelector('.student-form'))

const showPopup = () =>{
    $popup.classList.add('opened')
}

const hidePopup = () =>{
    $popup.classList.remove('opened')
    studentForm.closeForm()
}

const renderList = (data) => {
    $classmates.innerHTML = ''
    data.forEach(renderItem)
}
const renderItem = (elem) => {

        const $classmatesEl = $classmatesTemplate.cloneNode(true)
        const $classmatesImg = $classmatesEl.querySelector('.classmate__image')
        const $buttonDelete = $classmatesEl.querySelector('.button_delete')
        const $buttonEdit = $classmatesEl.querySelector('.button_edit')

        $classmatesImg.setAttribute('src', elem.avatarUrl)
        $classmatesImg.setAttribute('alt', elem.firstName)
        $classmatesEl.querySelector(".classmate__name").textContent = `${elem.firstName} ${elem.secondName}`
        $classmatesEl.querySelector(".classmate__course").textContent = `${elem.university} ${elem.course} курс`
        $classmatesEl.querySelector(".classmate__city").textContent = elem.city

        $classmates.appendChild($classmatesEl)

        $buttonDelete.addEventListener('click',(event) =>{
            event.preventDefault();

            classmatesApi.deleteItem(elem.id).then(() => {
                event.target.closest('.classmate')?.remove?.()
            })
        }) 

        $buttonEdit.addEventListener('click', (event) => {
            showPopup()
            studentForm.init((event) => {
                event.preventDefault()
                const data = {
                    id: elem.id,
                    secondName: event.target.elements[0].value,
                    firstName: event.target.elements[1].value,
                    patronymic: event.target.elements[2].value,
                    city: event.target.elements[3].value,
                    university: event.target.elements[4].value,
                    course: event.target.elements[5].value,
                    phone: event.target.elements[6].value,
                    mail: event.target.elements[7].value,
                    avatarUrl: event.target.elements[8].value
                }
                classmatesApi.updateItem(elem.id, data).then(() => {
                    classmatesApi.getItems().then((data) => renderList(data))
                    hidePopup()
                })
            },{
                second_name: elem.secondName,
                first_name: elem.firstName,
                patronymic: elem.patronymic,
                city: elem.city,
                university: elem.university,
                course: elem.course,
                phone: elem.phone,
                mail: elem.mail,
                url: elem.avatarUrl
            })
        })
}

classmatesApi.getItems().then((data) => renderList(data))

$addButton.addEventListener('click', () => {
    showPopup()
    studentForm.init((event) => {
        event.preventDefault()
        const data = {
            secondName: event.target.elements[0].value,
            firstName: event.target.elements[1].value,
            patronymic: event.target.elements[2].value,
            city: event.target.elements[3].value,
            university: event.target.elements[4].value,
            course: event.target.elements[5].value,
            phone: event.target.elements[6].value,
            mail: event.target.elements[7].value,
            avatarUrl: event.target.elements[8].value
        }
        classmatesApi.createItem(data).then(() => {
            classmatesApi.getItems().then((data) => renderList(data))
            hidePopup()
        })
    })
})

$popupCloseButton.addEventListener('click', () => {
    hidePopup()
})
