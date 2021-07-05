export interface User {
  id?: number;
  ref_code?: string;
  first_name?: string;
  last_name?: string;
  home_address?: string;
  birthday?: Date;
  contact_number?: string;
  email?: string;
  password?: string;
  active?: boolean;
  createdAt?: Date;
  updatedAt?: Date;
}
