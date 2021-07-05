import { Type } from 'class-transformer';
import { IsDate, IsEmail, IsNotEmpty, Length } from 'class-validator';

export class UserRegisterRequestDto {
  @IsNotEmpty()
  first_name?: string;

  @IsNotEmpty()
  last_name?: string;

  @IsNotEmpty()
  home_address?: string;

  @IsNotEmpty()
  @IsDate()
  @Type(() => Date)
  birthday?: Date;

  @IsNotEmpty()
  contact_number?: string;

  @IsNotEmpty()
  @IsEmail()
  email?: string;

  @IsNotEmpty()
  @Length(8, 24)
  password?: string;
}
