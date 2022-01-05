class Student{
    constructor(secondName, firstName, patronymic, city, university, course, phone, mail) {
        this.secondName = secondName 
        this.firstName = firstName
        this.patronymic = patronymic
        this.city = city
        this.university = university
        this.course = course
        this.phone = phone
        this.mail = mail
    }

    get firstName(){
        return this._firstName
    }

    set firstName(newFirstName){
        return this._firstName = newFirstName
    }
}

