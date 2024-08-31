import { useState } from "react";
import { Link } from "react-router-dom";
import { FaEdit } from "react-icons/fa";
import { MdDelete } from "react-icons/md";
import { IoIosArrowBack } from "react-icons/io";
import { FaPlus } from "react-icons/fa6";
import { CiMenuKebab } from "react-icons/ci";
import ConfirmationModal from "./pilot-confirmation-delete";
import "./pilot-management.css"

export default function PilotManagement() {
    const [showModal, setShowModal] = useState(false);
    const [pilotToDelete, setPilotToDelete] = useState<number | null>(null);

    const pilots = [
        { pilotID: 1, firstName: "Hugo Fernando", lastName: "Perez", middleName: "Oropeza", birthDate: "1990-08-25", gender: "H", militaryRank: "Teniente", registrationNumber: "7263833", identificationNumber: "8274612431", mobileNumber:"74853774" , flightHours: "523 Hrs"},
        { pilotID: 2, firstName: "Rodrigo", lastName: "Arnez", middleName: "Ramirez", birthDate: "1992-05-15", gender: "H", militaryRank: "Subteniente", registrationNumber: "876367", identificationNumber: "028937847", mobileNumber:"68565384" , flightHours: "995 Hrs"},
        { pilotID: 3, firstName: "David", lastName: "Peredo", middleName: "Canedo", birthDate: "1985-11-30", gender: "H", militaryRank: "Capitán", registrationNumber: "1827372", identificationNumber: "274616123", mobileNumber:"78453997" , flightHours: "684 Hrs"},
      ];

      const handleDeleteClick = (id: number) => {
        setPilotToDelete(id);
        setShowModal(true);
      };
    
      const handleCloseModal = () => {
        setShowModal(false);
        setPilotToDelete(null);
      };
    
      const handleConfirmDelete = () => {
        // Add your delete logic here
        console.log(`Deleted pilot with id: ${pilotToDelete}`);
        handleCloseModal();
      };

    return <>
        <div className="pilot-management-container">
            {/* Title */}
            <div>
                <h1>
                    <Link to={"/menu-principal/menu-operaciones"}><IoIosArrowBack className="pilot-management-goback-arrow" /></Link>GESTIÓN PILOTOS
                </h1>
            </div>
            
            
            {/* Add New Pilot Button */}
            <div className="pilot-management-add-button-container">
                <button>
                    <Link to={"/menu-principal/menu-operaciones/registro-piloto"}><FaPlus className="pilot-management-add-button-icon" />
                        
                    </Link>
                </button>
                <button className="functionsButton">
                    <Link to={"/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos"}>Ver funciones de pilotos
                        
                    </Link>
                </button>
            </div>
            
            {/* Pilot Table */}
            <table className="pilot-table">
                <thead>
                <tr>
                    <th>Nombre Completo</th>
                    <th>Fecha Nacimiento</th>
                    <th>Género</th>
                    <th>Grado Militar</th>
                    <th>N# Registro</th>
                    <th>N# Identificación</th>
                    <th>Celular</th>
                    <th>Horas Vuelo</th>
                    <th>Editar | Eliminar</th>
                </tr>
                </thead>
                <tbody>
                {pilots.map((pilot) => (
                    <tr key={pilot.pilotID}>
                    <td>{pilot.firstName} {pilot.lastName} {pilot.middleName}</td>
                    <td>{pilot.birthDate}</td>
                    <td>{pilot.gender}</td>
                    <td>{pilot.militaryRank}</td>
                    <td>{pilot.registrationNumber}</td>
                    <td>{pilot.identificationNumber}</td>
                    <td>{pilot.mobileNumber}</td>
                    <td>{pilot.flightHours}</td>
                    <td>
                        <Link to={"/menu-principal/menu-operaciones/editar-piloto"}><FaEdit className="pilot-management-edit-button"/></Link>
                        <button className="pilot-management-delete-button" onClick={() => handleDeleteClick(pilot.pilotID)}><MdDelete /></button>
                    </td>
                    </tr>
                ))}
                </tbody>
            </table>

            <div className="pilot-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="pilot-management-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                    </div>
            </div>
        </div>

        {/* Confirmation Modal */}
      <ConfirmationModal
        show={showModal}
        onClose={handleCloseModal}
        onConfirm={handleConfirmDelete}
        message="¿Está seguro de que desea eliminar este piloto?"
      />
    </>
}
