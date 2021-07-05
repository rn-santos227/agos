import { BeforeInsert, Column, Entity } from 'typeorm';
import { BaseEntity } from 'src/common/entities/base-entity';
import * as bcrypt from 'bcrypt';

@Entity('users')
export class UserEntity extends BaseEntity {
  @Column({ type: 'varchar', length: 100, nullable: false })
  first_name: string;
  @Column({ type: 'varchar', length: 100, nullable: false })
  last_name: string;
  @Column({ type: 'varchar', nullable: false })
  home_address: string;
  @Column({ type: 'varchar', nullable: false })
  contact_number: string;
  @Column({ type: 'varchar', nullable: false })
  email: string;
  @Column({ type: 'text', nullable: false })
  password: string;
  @Column({ type: 'date', nullable: false })
  birthday: Date;

  @BeforeInsert()
  async setPassword(password: string) {
    const salt = await bcrypt.genSalt();
    this.password = await bcrypt.hash(password || this.password, salt);
  }
}
