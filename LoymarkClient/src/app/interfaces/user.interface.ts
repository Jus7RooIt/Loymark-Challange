import { Country } from "./country.interface"

export interface User {
  idUser: number
  name?: string
  lastName?: string
  email?: string
  birthDate?: Date
  phoneNumber?: string
  countryCode?: string;
  country?: Country
  isNewsletterConfirmed?: boolean
  lowDate?: Date
}
