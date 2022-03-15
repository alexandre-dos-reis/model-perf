import { PrismaClient, Utilisateur, Auditeur, Groupe, AuditeurGroupe } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createAuditeursAndGroupes() {

  faker.locale = 'fr';

  const utilisateurs: Utilisateur[] = await prisma.utilisateur.findMany()
  
  let auditeurs: Auditeur[] = []
  
  utilisateurs.map(u => {
    auditeurs.push({
      IdUtilisateur: u.IdUtilisateur
    })
  })

  await prisma.auditeur.createMany({
    data: auditeurs
  })

  const groupeCreated = await prisma.groupe.findMany()
  const auditeursCreated = await prisma.auditeur.findMany()

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