from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from service_db import execute_query
from student import Student
import uvicorn
from const import SERVER_IP,SERVER_PORT


app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=['*'],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get('/students')
def student_list():
    query = """
        select 
            id,
            second_name as "secondName",
            first_name as "firstName",
            patronymic,
            city,
            university,
            course,
            phone,
            mail,
            avatar_url as "avatarUrl"
        from students
    """
    return execute_query(query)

@app.put('/students/{id}')
def update_item(id: int, payload: Student):
    query = """
        update students 
        set second_name = %s::character varying, first_name = %s::character varying, 
        patronymic = %s::character varying, city = %s::character varying, university = %s::character varying,
        course = %s::int, phone = %s::bigint, mail = %s::character varying, avatar_url = %s::text
        where id = %s::int
    """
    execute_query(query, 
        payload.secondName,
        payload.firstName,
        payload.patronymic,
        payload.city,
        payload.university,
        payload.course,
        payload.phone,
        payload.mail,
        payload.avatarUrl,
        payload.id
    )

@app.post('/students/')
def create_item(payload: Student):
    query = """
        insert into students (second_name, first_name, patronymic, city, university, course, phone, mail,avatar_url)
        values(%s::character varying, %s::character varying, 
        %s::character varying, %s::character varying, %s::character varying,
        %s::int, %s::bigint, %s::character varying, %s::text)
    """
    execute_query(query, 
        payload.secondName,
        payload.firstName,
        payload.patronymic,
        payload.city,
        payload.university,
        payload.course,
        payload.phone,
        payload.mail,
        payload.avatarUrl,
    )

@app.delete('/students/{id}')
def delete_item(id: int):
    query = 'delete from students where id = %s::int'
    execute_query(query, id)

if __name__=='__main__':
    uvicorn.run(app, host=SERVER_IP, port=SERVER_PORT)