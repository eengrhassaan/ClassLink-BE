import { ApiProperty } from "@nestjs/swagger";
import { IsInt, IsOptional, IsString } from "class-validator";

export class UserDto {

    
    @IsOptional()
    @ApiProperty()
    @IsInt()
    Id: string;

    @IsOptional()
    @ApiProperty()
    @IsString()
    UserName: string;

    @IsOptional()
    @ApiProperty()
    @IsString()
    Password: string;

    @IsOptional()
    @ApiProperty()
    @IsString()
    Role: string;
    
}
