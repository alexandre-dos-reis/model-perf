import { PrismaClient, Utilisateur, Concepteur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createConcepteurs() {

  faker.locale = 'fr';

  const utilisateurs: Utilisateur[] = await prisma.utilisateur.findMany()
  
  let concepteurs: Concepteur[] = []
  
  utilisateurs.map(u => {
    concepteurs.push({
      IdUtilisateur: u.IdUtilisateur
    })
  })

  await prisma.concepteur.createMany({
    data: concepteurs
  })

}