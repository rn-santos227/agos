import { forwardRef, Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { ApiConfigService } from '../../shared/services/api-config.service';
import { UserModule } from '../users/user.module';
import { AuthController } from './auth.controller';

@Module({
  imports: [
    forwardRef(() => UserModule),
    PassportModule.register({ defaultStrategy: 'jwt' }),
    JwtModule.registerAsync({
      useFactory: (configService: ApiConfigService) => ({
        secretOrPrivateKey: configService.authConfig.jwtSecret,
        // if you want to use token with expiration date
        // signOptions: {
        //     expiresIn: configService.getNumber('JWT_EXPIRATION_TIME'),
        // },
      }),
      inject: [ApiConfigService],
    }),
  ],
  controllers: [AuthController],
})
export class AuthModule {}
