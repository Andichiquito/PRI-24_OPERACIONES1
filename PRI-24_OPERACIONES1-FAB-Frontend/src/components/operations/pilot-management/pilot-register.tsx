import { Link } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import "./pilot-register.css";
import { CiMenuKebab } from "react-icons/ci";

export default function RegisterPilotForm() {
  return <>
    <div className="register-pilot-container">
        <div>
            <h1>
                <Link to={"/menu-principal/menu-operaciones/gestion-pilotos"}><IoIosArrowBack className="register-pilot-goback-arrow" /></Link><b>GESTIÓN PILOTOS</b>
                <span className="small-text"> &gt; Registrar Piloto</span>
            </h1>
        </div>

      {/* Pilot Registration Form */}
      <div className="register-pilot-form-container">
                    
                    <div className="register-pilot-content">
                        <div className="register-pilot-info-section">
                            <div className="register-pilot-label-input-container">
                                <label className="label-section"><strong>Nombre:</strong></label>
                                <input type="text" />
                            </div>
                            
                            <div className="register-pilot-label-input-container">
                                <label className="label-section"><strong>Apellido Paterno:</strong></label>
                                <input type="text" />
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Apellido Materno:</strong></label>
                                <input type="text" />
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Grado Militar:</strong></label>
                                <select>
                                    <option value="teniente">Teniente Coronel</option>
                                    <option value="capitan">Capitán</option>
                                    <option value="teniente">Teniente</option>
                                    <option value="subteniente">Subteniente</option>
                                    <option value="sargento">Sargento</option>
                                </select>
                            </div>
                            
                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Función:</strong></label>
                                <select>x
                                    <option value="Aviador">Aviador</option>
                                    <option value="Coaviador">Coaviador</option>
                                    <option value="Instructor">Instructor de Vuelo</option>
                                </select>
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Número de Registro:</strong></label>
                                <input type="text" />
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Género:</strong></label>
                                <select>
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                </select>
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Número de Identificación:</strong></label>
                                <input type="text" />
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Fecha de Nacimiento:</strong></label>
                                <input type="date" />
                            </div>

                            <div className="register-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Celular:</strong></label>
                                <input type="text" />
                            </div>
                            

                        </div>
                        <br />
                        <div>
                            <button className="register-pilot-button">Registrar Piloto</button>
                        </div>
                        
                    </div>
                </div>
                <div className="pilot-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="register-pilot-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                </div>
            </div>
    </div>
  </>
}

