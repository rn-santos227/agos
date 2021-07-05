import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { from, Observable } from 'rxjs';
import { Repository } from 'typeorm';
import { UserEntity } from './models/user.entity';
import { User } from './models/user.inteface';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(UserEntity)
    private readonly userRepository: Repository<UserEntity>,
  ) {}

  createUser(user: User): Observable<User> {
    user.ref_code = Math.random().toString(36).substring(2);
    return from(this.userRepository.save(user));
  }

  findOne(findData: User): Promise<UserEntity> {
    return this.userRepository.findOne(findData.id);
  }
}
