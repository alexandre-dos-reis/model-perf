import { AuditeurGroupe, Examen, Groupe, PrismaClient, QCM, Utilisateur } from '@prisma/client'

const prisma = new PrismaClient()

export default async function bonneReponses() {

    const measurement: string = "Toutes les questions posées qui ont pour réponses exacte 60 points"

    console.time(measurement)
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
    console.timeEnd(measurement)
    // 5.607s
    // 5.584s
    // 5.467s

   


}