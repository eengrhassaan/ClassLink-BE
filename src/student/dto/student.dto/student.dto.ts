import {IsArray, IsBoolean, IsEmail, IsInt, IsOptional, IsString, IsStrongPassword} from 'class-validator'
import { ApiProperty } from '@nestjs/swagger';

export class StudentDto {

    @ApiProperty({required: false})
    @IsOptional()
    @IsInt()
    Id?: number;

    @ApiProperty({required: true})
    @IsEmail()
    Email: string;

    @ApiProperty({required: true})
    @IsString()
    UserName: string;
    
    @ApiProperty({required: false})
    @IsOptional()
    @IsArray()
    @IsInt({each: true})
    coursesIds?: number[];

    @ApiProperty({required: true})
    @IsString()
    FirstName: string

    @ApiProperty({required: false})
    @IsOptional()
    @IsString()
    LastName: string

    @ApiProperty({required: true})
    @IsOptional()
    @IsString()
    @IsStrongPassword()
    Password: string

    @IsBoolean()
    isActive: Boolean
}
