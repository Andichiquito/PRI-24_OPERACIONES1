import { Link } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import "./pilot-airship-role-register.css";
import { CiMenuKebab } from "react-icons/ci";

export default function RegisterPilotAirshipForm() {
  return <>
    <div className="register-pilotairship-container">
        <div>
            <h1>
                <Link to={"/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos"}><IoIosArrowBack className="register-pilotairship-goback-arrow" /></Link><b>Funciones de Pilotos</b>
                <span className="small-text"> &gt; Registrar Función de Piloto</span>
            </h1>
        </div>

      {/* Pilot Registration Form */}
      <div className="register-pilotairship-form-container">
                    
                    <div className="register-pilotairship-content">
                        <div className="register-pilotairship-info-section">
                            <div className="register-pilotairship-label-input-container">
                                <label className="label-section"><strong>Piloto:</strong></label>
                                <select>
                                    <option value="">Hugo Fernando Perez Oropeza</option>
                                    <option value="">Rodrigo Arnez Ramirez</option>
                                    <option value="">David Peredo Canedo</option>
                                </select>
                            </div>
                            
                            <div className="register-pilotairship-label-input-container">
                                <label className="label-section"><strong>Aeronave:</strong></label>
                                <select>
                                    <option value="">FAB-754, AS 350 - B3</option>
                                    <option value="">FAB-755, AS 350 - B3</option>
                                    <option value="">FAB-756, AS 350 - B3</option>
                                    <option value="">FAB-757, AS 350 - B3</option>
                                    <option value="">FAB-758, AS 350 - B3</option>
                                    <option value="">FAB-759, AS 350 - B3</option>
                                </select>
                            </div>
                            
                            <div className="register-pilotairship-label-input-container">
                                <br />
                                <label className="label-section"><strong>Función:</strong></label>
                                <select>x
                                    <option value="Aviador">Aviador</option>
                                    <option value="Coaviador">Coaviador</option>
                                    <option value="Instructor">Instructor de Vuelo</option>
                                </select>
                            </div>

                        </div>
                        <br />
                        <div>
                            <button className="register-pilotairship-button">Registrar Función</button>
                        </div>
                        
                    </div>
                </div>
                <div className="pilotairship-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="register-pilotairship-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                </div>
            </div>
    </div>
  </>
}

