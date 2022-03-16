import { AuditeurGroupe, Examen, Groupe, PrismaClient, QCM, TypeU, Utilisateur } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createAuditeurGroupe() {

    faker.locale = "fr"

    const typeAuditeur = await prisma.typeU.findFirst({
        where: {
            libelle: "Auditeur"
        }
    })
    const auditeurs: Utilisateur[] = []

    for (let i = 0; i <= 162; i++) {
  
        const prenom = faker.name.firstName()
        const nom = faker.name.lastName()
    
        const auditeur: Utilisateur = {
          prenom: prenom,
          nom: nom,
          email: faker.internet.email(prenom, nom),
          password: faker.internet.password(),
          IdTypeU: typeAuditeur?.IdTypeU as number,
  
        }
        auditeurs.push(auditeur)
      }
    
      await prisma.utilisateur.createMany({
        data: auditeurs
      })

    const groupeCreated = await prisma.groupe.findMany()
    const auditeursCreated = await prisma.utilisateur.findMany()

    const auditeursGroupe: AuditeurGroupe[] = []

    auditeursCreated.map(a => {
        const auditeurGroupe: AuditeurGroupe= {
            IdUtilisateur: a.IdUtilisateur,
            code: faker.random.arrayElement(groupeCreated).code
        }

        auditeursGroupe.push(auditeurGroupe)

    })

    await prisma.auditeurGroupe.createMany({
        data: auditeursGroupe
    })

   


}