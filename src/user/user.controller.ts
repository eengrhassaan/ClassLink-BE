import { Body, Controller, Get } from '@nestjs/common';

@Controller('user')
export class UserController {

    @Get('login')
    async login(@Body() userDto: UserDtO){
        return true
    }
}
