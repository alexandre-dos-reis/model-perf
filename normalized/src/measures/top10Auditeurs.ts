import { AuditeurGroupe, Examen, Groupe, PrismaClient, QCM, Utilisateur } from '@prisma/client'

const prisma = new PrismaClient()

export default async function bonneReponses() {

    const measurement: string = "Top 10 auditeurs"

    // console.time(measurement)

    // console.log(await prisma.auditeur.findMany({
    //     take: 10,
    //     where: {
    //         ReponseAuditeurExam: {
    //             every: {
    //                 Reponse: {
                        
    //                 }
    //             }
    //         }
    //     }
    // }))

    // console.timeEnd(measurement)


   


}