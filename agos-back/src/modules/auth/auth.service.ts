import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

import { ApiConfigService } from '../../shared/services/api-config.service';
import { UserService } from '../users/user.service';

@Injectable()
export class AuthService {
  constructor(
    public readonly jwtService: JwtService,
    public readonly configService: ApiConfigService,
    public readonly userService: UserService,
  ) {}
}
