import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import { RouterProvider, createBrowserRouter } from 'react-router-dom';
import Login from './components/user/login/login.tsx';
import MainMenu from './components/main-menu/main-menu.tsx';
import PilotManagement from './components/operations/pilot-management/pilot-management.tsx';
import AirshipManagement from './components/operations/airship-management/airship-management.tsx';
import OperationsMenu from './components/operations/operations-menu/operations-menu.tsx';
import AirshipRegisterManagement from './components/operations/airship-register-management/airship-register-management.tsx';
import RegisterPilotForm from './components/operations/pilot-management/pilot-register.tsx';
import EditPilotForm from './components/operations/pilot-management/pilot-edit.tsx';
import McList from './components/operations/medical-check/mc_list.tsx';
import McRegister from './components/operations/medical-check/mc_register.tsx';
import McEdit from './components/operations/medical-check/mc_edit.tsx';
import AirshipEditManagement from './components/operations/airship-management/airship-edit-management.tsx';
import PilotAirshipManagement from './components/operations/pilot-airship-role/pilot-airship-role-management.tsx';
import RegisterPilotAirshipForm from './components/operations/pilot-airship-role/pilot-airship-role-register.tsx';
import EditPilotAirshipForm from './components/operations/pilot-airship-role/pilot-airship-role-edit.tsx'

const router = createBrowserRouter([
  { path:  "/",  element: <Login /> },
  { path:  "/menu-principal",  element: <MainMenu /> },
  { path:  "/menu-principal/menu-operaciones/gestion-pilotos",  element: <PilotManagement /> },
  { path:  "/menu-principal/menu-operaciones/gestion-aereonave",  element: <AirshipManagement /> },
  { path:  "/menu-principal/menu-operaciones/gestion-aereonave/gestion-aereonave-registrar",  element: <AirshipRegisterManagement /> },
  { path:  "/menu-principal/menu-operaciones/gestion-aereonave/gestion-aereonave-editar",  element: <AirshipEditManagement /> },
  { path:  "/menu-principal/menu-operaciones",  element: <OperationsMenu /> },
  { path:  "/menu-principal/menu-operaciones/registro-piloto",  element: <RegisterPilotForm /> },
  { path:  "/menu-principal/menu-operaciones/mc-lista",  element: <McList /> },
  { path:  "/menu-principal/menu-operaciones/mc-registro",  element: <McRegister /> },
  { path:  "/menu-principal/menu-operaciones/mc-editar",  element: <McEdit /> },
  { path:  "/menu-principal/menu-operaciones/editar-piloto",  element: <EditPilotForm /> },
  { path:  "/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos",  element: <PilotAirshipManagement /> },
  { path:  "/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos/editar-funcion-piloto",  element: <EditPilotAirshipForm /> },
  { path:  "/menu-principal/menu-operaciones/gestion-pilotos/gestion-funciones-pilotos/registrar-funcion-piloto",  element: <RegisterPilotAirshipForm /> },
]);

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
      <RouterProvider router={router}/>
  </React.StrictMode>
)

