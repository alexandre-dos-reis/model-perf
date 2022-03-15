import { PrismaClient, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createUTypes() {

  faker.locale = 'fr';

  await prisma.typeU.createMany({
      data: [
          {libelle: "Concepteur"},
          {libelle: "Auditeur"}
      ]
  })


}