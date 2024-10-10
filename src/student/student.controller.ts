import { Controller, Get, Post, Put, Delete, Req, Param, Body } from '@nestjs/common';
import { Request } from 'express';
import { StudentService } from './student.service';
import { StudentDto } from './dto/student.dto/student.dto';

@Controller('student')
export class StudentController {

    constructor (private readonly studentService: StudentService) {}

    // Get All Students
    @Get('/getStudents/')
    async getStudents(){
        const students = await this.studentService.getAllStudents();
        return students;
    }

    // Get Student By Id
    @Get('/getStudents/:id?')
    async getStudentById(@Param('id') id?: number){        
        const student = await this.studentService.getStudentById(Number(id))
        return student
    }

    // Create Student
    @Post('createStudent')
    async createStudent(@Body() studentDto:StudentDto){
        const createdStudent = await this.studentService.createStudent(studentDto)
        return createdStudent
    }
}
