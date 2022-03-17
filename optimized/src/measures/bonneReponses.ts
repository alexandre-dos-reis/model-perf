import { AuditeurGroupe, Examen, Groupe, PrismaClient, QCM, TypeU, Utilisateur } from '@prisma/client'

const prisma = new PrismaClient()

export default async function bonneReponses() {

    console.time("Toutes les questions posées qui ont pour réponses exacte 60 points")
    await prisma.reponseAuditeurExam.findMany({
        where: {
            Reponse: {
                exactitude: 60
            }
        },
        include: {
            Reponse: {
                include: {
                    Question: {}
                }
            }
        }
    })
    console.timeEnd("Toutes les questions posées qui ont pour réponses exacte 60 points")
    // 1.013s
    // 930.396ms
    // 925.407ms

   


}