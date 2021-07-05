import { Column, Entity } from 'typeorm';
import { BaseEntity } from 'src/common/entities/base-entity';

@Entity('users')
export class User extends BaseEntity {
  @Column({ type: 'varchar', length: 100, nullable: false })
  first_name: string;
  @Column({ type: 'varchar', length: 100, nullable: false })
  last_name: string;
  @Column({ type: 'varchar', nullable: false })
  home_address: string;
  @Column({ type: 'varchar', nullable: false })
  birthday: Date;
  @Column({ type: 'date', nullable: false })
  contact_number: string;
  @Column({ type: 'varchar', nullable: false })
  email_address: string;
  @Column({ type: 'boolean', nullable: false })
  active: boolean;
}
