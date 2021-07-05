import { Column, Entity } from 'typeorm';
import { BaseEntity } from 'src/common/entities/base-entity';

@Entity('responses')
export class Response extends BaseEntity {
  @Column({ type: 'int', nullable: false })
  form_id: number;
  @Column({ type: 'int', nullable: true })
  user_id: number;
  @Column({ type: 'varchar', length: 100, nullable: false })
  email: string;
  @Column({ type: 'date', nullable: false })
  date: Date;
}
