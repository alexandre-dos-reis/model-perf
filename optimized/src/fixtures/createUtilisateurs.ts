import { PrismaClient, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createUtilisateurs() {

    faker.locale = 'fr';

    const typesU = await prisma.typeU.findMany()
    let utilisateurs: Utilisateur[] = []

    for (let i = 0; i <= 80; i++) {
  
      const prenom = faker.name.firstName()
      const nom = faker.name.lastName()
  
      const u: Utilisateur = {
        prenom: prenom,
        nom: nom,
        email: faker.internet.email(prenom, nom),
        password: faker.internet.password(),
        IdTypeU: typesU.find(t => t.libelle === "Concepteur")?.IdTypeU as number,

      }
      utilisateurs.push(u)
    }
  
    await prisma.utilisateur.createMany({
      data: utilisateurs
    })


}