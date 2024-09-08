import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { FaEdit } from "react-icons/fa";
import { MdDelete } from "react-icons/md";
import { IoIosArrowBack } from "react-icons/io";
import { FaPlus } from "react-icons/fa6";
import { CiMenuKebab } from "react-icons/ci";
import ConfirmationModal from "../pilot-management/pilot-confirmation-delete";
import './mc_list.css'

// Definimos la interfaz para el tipo de piloto
interface Pilot {
    pilotID: number;
    firstName: string;
    lastName: string;
    middleName: string;
    birthDate: string;
    gender: string;
    militaryRank: string;
    nextCheck: string;
    observations: string;
    status?: 'normal' | 'por_vencer' | 'vencido';
}

export default function McList (){
    const [showModal, setShowModal] = useState(false);
    const [mcDelete, setMcToDelete] = useState<number | null>(null);

    const [pilots, setPilots] = useState<Pilot[]>([
        { pilotID: 1, firstName: "Hugo Fernando", lastName: "Perez", middleName: "Oropeza", birthDate: "1990-08-25", gender: "H", militaryRank: "Teniente", nextCheck: "2024-06-21", observations: "Ninguna"},
        { pilotID: 2, firstName: "Rodrigo", lastName: "Arnez", middleName: "Ramirez", birthDate: "1992-05-15", gender: "H", militaryRank: "Subteniente", nextCheck: "2024-06-03",  observations: "Ninguna"},
        { pilotID: 3, firstName: "David", lastName: "Peredo", middleName: "Canedo", birthDate: "1985-11-30", gender: "H", militaryRank: "Capitán", nextCheck: "2024-10-05",  observations: "Ninguna"},
    ]);

    useEffect(() => {
        const currentDate = new Date();
        const updatedPilots = pilots.map(pilot => {
            const checkDate = new Date(pilot.nextCheck);
            const daysDifference = Math.ceil((checkDate.getTime() - currentDate.getTime()) / (1000 * 3600 * 24));
            
            let status: 'normal' | 'por_vencer' | 'vencido' = 'normal';
            if (daysDifference < 0) {
                status = 'vencido';
            } else if (daysDifference <= 30) {
                status = 'por_vencer';
            }
            
            return { ...pilot, status };
        });
        setPilots(updatedPilots);
    }, []);

    const handleDeleteClick = (id: number) => {
        setMcToDelete(id);
        setShowModal(true);
      };

    const handleCloseModal = () => {
        setShowModal(false);
        setMcToDelete(null);
      };
    
      const handleConfirmDelete = () => {
        // Add your delete logic here
        console.log(`Deleted pilot with id: ${mcDelete}`);
        handleCloseModal();
      };

    return <>
        <div className="container-list">
            <div className='mc-container-list'>
                <div className="mc-header-action">
                    <a href="">
                        <Link className="mc-black" to={'/menu-principal/menu-operaciones'}><IoIosArrowBack size={30}/></Link>
                        <span>CHEQUEO MÉDICO</span>
                    </a>
                </div>
            
                <div className="mc-card-1-list">
                    <form action="">
                        <button type="submit" className="mc-btn-icon-list">
                            <Link className="mc-black" to={'/menu-principal/menu-operaciones/mc-registro'}><FaPlus/></Link>
                        </button>
                    </form>
                    <div className="mc-group-list">
                        <p>Buscar personal </p>
                        <input className="mc-left mc-textInput-list" type="text"/>
                        <button type="submit" className="mc-left mc-btn-icon-list">
                            <img width={20} src="/search.png" alt="Search" />
                        </button>
                    </div>
                    <div>
                        <table>
                            <thead className='mc-thead-list'>
                                <tr>
                                    <th>GRADO</th>
                                    <th>NOMBRES Y APELLIDOS</th>
                                    <th>EC-145</th>
                                    <th>AS350 B3</th>
                                    <th>PRÓXIMO CHEQUEO</th>
                                    <th>OBSERVACIONES</th>
                                    <th>Editar | Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                            {pilots.map((pilot) => (
                                <tr key={pilot.pilotID} className={pilot.status ? `mc-row-${pilot.status}` : ''}>
                                <td>{pilot.militaryRank}</td>
                                <td>{pilot.firstName} {pilot.lastName} {pilot.middleName}</td>
                                <td>C.A</td>
                                <td>P.A</td>
                                <td>{new Date(pilot.nextCheck).toLocaleDateString()}</td>
                                <td>{pilot.observations}</td>
                                <td>
                                    <p>
                                        <Link className="mc-edit" to={'/menu-principal/menu-operaciones/mc-editar'}><FaEdit/></Link>
                                    </p>
                                    <p>
                                        <button className="mc-delete" onClick={() => handleDeleteClick(pilot.pilotID)}><MdDelete /></button>
                                    </p>
                                </td>
                                </tr>
                            ))}
                            </tbody>
                        </table>
                    </div>
                </div>
                <div className="mc-user-info-container">
                    <span className="mc-username">USER76234</span>
                    <button className="mc-forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="mc-management-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                    </div>
                </div>
            </div>
        </div>
        {/* Confirmation Modal */}
        <ConfirmationModal
        show={showModal}
        onClose={handleCloseModal}
        onConfirm={handleConfirmDelete}
        message="¿Está seguro de que desea eliminar este Chequeo médico?"
      />
    </>
}