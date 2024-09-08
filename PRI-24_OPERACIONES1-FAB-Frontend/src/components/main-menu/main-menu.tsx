import { AiOutlineTool } from "react-icons/ai"
import "./main-menu.css"
import { TbManualGearbox } from "react-icons/tb"
import { MdOutlineWarehouse } from "react-icons/md"
import { LuCross } from "react-icons/lu"
import { Link } from "react-router-dom"

export default function MainMenu() {
    return(
        <div className="main-menu-container">
            <div className="main-menu-options">
                <Link className="card" to={"/menu-principal/menu-operaciones"}>
                    <TbManualGearbox />
                    <span>Operaciones</span>
                </Link>
                <Link className="card" to={"/"}>
                    <AiOutlineTool />
                    <span>Mantenimiento</span>
                </Link>
                <Link className="card" to={"/"}>
                    <MdOutlineWarehouse />
                    <span>Almacenes</span>
                </Link>
                <Link className="card" to={"/"}>
                    <LuCross />
                    <span>SAR FAB</span>
                </Link>
            </div>
        </div> 
    )
}