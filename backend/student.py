from pydantic import BaseModel

class Student(BaseModel):
    id: int = None
    secondName: str
    firstName: str
    patronymic: str
    city: str
    university: str
    course: int
    phone: int
    mail: str
    avatarUrl: str