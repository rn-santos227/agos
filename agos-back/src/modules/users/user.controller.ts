import { Body, Controller, Post } from '@nestjs/common';
import { Observable } from 'rxjs';
import { SETTINGS } from 'src/app.utils';
import { UserRegisterRequestDto } from './dto/user-register.req.dto';
import { User } from './models/user.inteface';
import { UserService } from './user.service';

@Controller('users')
export class UserController {
  constructor(private readonly usersService: UserService) {}

  @Post('/register')
  async create(
    @Body(SETTINGS.VALIDATION_PIPE)
    user: UserRegisterRequestDto,
  ): Promise<Observable<User>> {
    return this.usersService.createUser(user);
  }
}
