import { User } from "./user.interface"

export interface Activity {
  IdActivity: number
  detail: string
  LastName: string
  Email: string
  CreationDate: Date
  PhoneNumber: string
  CountryCode: string;
  User: User
  IsNewsletterConfirmed: boolean
  LowDate: Date
}
