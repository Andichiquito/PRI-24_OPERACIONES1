import { useState } from "react";
import { Link } from "react-router-dom";
import { FaEdit } from "react-icons/fa";
import { MdDelete } from "react-icons/md";
import { IoIosArrowBack } from "react-icons/io";
import { FaPlus } from "react-icons/fa6";
import { CiMenuKebab } from "react-icons/ci";
import ConfirmationModal from "./pilot-airship-confirmation-delete";
import "./pilot-airship-role-management.css"

export default function PilotAirshipManagement() {
    const [showModal, setShowModal] = useState(false);
    const [pilotAirshipToDelete, setPilotAirshipToDelete] = useState<number | null>(null);

    const pilots = [
        { pilotID: 1, firstName: "Hugo Fernando", lastName: "Perez", middleName: "Oropeza", militaryRank: "Teniente"},
        { pilotID: 2, firstName: "Rodrigo", lastName: "Arnez", middleName: "Ramirez", militaryRank: "Subteniente"},
        { pilotID: 3, firstName: "David", lastName: "Peredo", middleName: "Canedo", militaryRank: "Capitán"},
      ];

    const airships = [
        { id: 1, matricula: "FAB-754", model: "AS 350", version: "B3"},
        { id: 2, matricula: "FAB-755", model: "AS 350", version: "B3"},
        { id: 3, matricula: "FAB-756", model: "AS 350", version: "B3"},
        { id: 4, matricula: "FAB-757", model: "AS 350", version: "B3"},
        { id: 5, matricula: "FAB-758", model: "AS 350", version: "B3"},
        { id: 6, matricula: "FAB-759", model: "AS 350", version: "B3"},
        
    ];

    const pilots_airships = [
        { id: 1,idPilot: 1, idAirship: 2, role: "Aviador"},
        { id: 2, idPilot: 1, idAirship: 4, role: "Instructor de Vuelo"},
        { id: 3, idPilot: 2, idAirship: 5, role: "Coaviador"},
        { id: 4, idPilot: 2, idAirship: 1, role: "Coaviador"},
        { id: 5, idPilot: 3, idAirship: 3, role: "Instructor de Vuelo"},
        { id: 6, idPilot: 3, idAirship: 1, role: "Aviador"},
        { id: 7, idPilot: 3, idAirship: 6, role: "Aviador"},
    ];

      const handleDeleteClick = (id: number) => {
        setPilotAirshipToDelete(id);
        setShowModal(true);
      };
    
      const handleCloseModal = () => {
        setShowModal(false);
        setPilotAirshipToDelete(null);
      };
    
      const handleConfirmDelete = () => {
        // Add your delete logic here
        console.log(`Deleted pilot-airship with id: ${pilotAirshipToDelete}`);
        handleCloseModal();
      };

    // Transforming data
    const pilotAirshipData = pilots.map(pilot => {
        const pilotAirships = pilots_airships
            .filter(pa => pa.idPilot === pilot.pilotID)
            .map(pa => {
                const airship = airships.find(a => a.id === pa.idAirship);
                return { ...airship, role: pa.role, pilotAirshipId: pa.id };
            });

        return {
            ...pilot,
            airships: pilotAirships
        };
    });

    return <>
        <div className="pilotairship-management-container">
            {/* Title */}
            <div>
                <h1>
                    <Link to={"/menu-principal/menu-operaciones/gestion-pilotos"}><IoIosArrowBack className="pilotairship-management-goback-arrow" /></Link>GESTIÓN PILOTOS
                    <span className="small-text"> &gt; Funciones de Pilotos</span>
                </h1>
            </div>
            
            
            {/* Add New Pilot Button */}
            <div className="pilotairship-management-add-button-container">
                <button>
                    <Link to={"/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos/registrar-funcion-piloto"}><FaPlus className="pilotairship-management-add-button-icon" />
                        
                    </Link>
                </button>
            </div>
            
            <table className="bigTable">
                <thead>
                    <tr>
                        <th>Nombre Completo</th>
                        <th>Grado Militar</th>
                        <th>Aeronaves</th>
                        <th>Funciones</th>
                        <th>Editar | Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                {pilotAirshipData.map((pilot) => (
                    <tr key={pilot.pilotID}>
                        <td>{pilot.firstName} {pilot.middleName} {pilot.lastName}</td>
                        <td>{pilot.militaryRank}</td>
                                <td>
                                    <table className="smallTable">
                                        <tbody>
                                            {pilot.airships.map((airship, index) => (
                                                <tr key={index}>
                                                    <td className="airship-role-cell">{airship.model} ({airship.matricula})</td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </td>
                                <td>
                                    <table className="smallTable">
                                        <tbody>
                                            {pilot.airships.map((airship, index) => (
                                                <tr key={index}>
                                                    <td className="airship-role-cell">{airship.role}</td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </td>
                        <td>
                            <table className="smallTable">
                                <tbody>
                                    {pilot.airships.map((airship, index) => (
                                                <tr key={index}>
                                                    <td>
                                                        <Link to={"/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos/editar-funcion-piloto"}><FaEdit className="pilotairship-management-edit-button"/></Link>
                                                        <button className="pilotairship-management-delete-button" onClick={() => handleDeleteClick(airship.pilotAirshipId)}><MdDelete /></button>
                                                    </td>
                                                </tr>
                                    ))}
                                </tbody>
                            </table>
                        </td>
                    </tr>
                ))}
                </tbody>
            </table>

            <div className="pilotairship-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="pilotairship-management-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                    </div>
            </div>
        </div>

        {/* Confirmation Modal */}
      <ConfirmationModal
        show={showModal}
        onClose={handleCloseModal}
        onConfirm={handleConfirmDelete}
        message="¿Está seguro de que desea eliminar esta función del piloto?"
      />
    </>
}
