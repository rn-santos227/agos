import { Column, Entity } from 'typeorm';
import { BaseEntity } from 'src/common/entities/base-entity';

@Entity('options')
export class Option extends BaseEntity {
  @Column({ type: 'int', nullable: false })
  form_id: number;
  @Column({ type: 'int', nullable: false })
  type: number;
  @Column({ type: 'varchar', length: 100, nullable: false })
  title: string;
  @Column({ type: 'varchar', length: 100, nullable: true })
  photo: string;
}
