import { PrismaClient, Utilisateur, ReponseAuditeurExam } from '@prisma/client'
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient()

export default async function createReponseAuditeurExams() {

  faker.locale = 'fr';

  const auditeurs = await prisma.utilisateur.findMany({
      where: {
          TypeU: {
              libelle: "Auditeur"
          }
      }
  })
  const reponses = await prisma.reponse.findMany()
  const examens = await prisma.examen.findMany()

  const reponsesAuditeurExam: ReponseAuditeurExam[] = []

  reponses.map(r => {

    const reponseAuditeurExam: ReponseAuditeurExam = {
        NumReponse: r.NumReponse,
        IdExamen: faker.random.arrayElement(examens).IdExamen,
        IdUtilisateur: faker.random.arrayElement(auditeurs).IdUtilisateur,
        valeur: faker.random.word(),
    }

    reponsesAuditeurExam.push(reponseAuditeurExam)

  })

  await prisma.reponseAuditeurExam.createMany({
      data: reponsesAuditeurExam
  })

}