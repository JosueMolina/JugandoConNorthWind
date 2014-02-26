using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.ClasesDTO;

namespace JugandoConNorthWind.Repositorio
{
    public class EmpleadosRepositorio
    {
        private NorthwindEntities _context;

        public EmpleadosRepositorio(NorthwindEntities context)
        {
            _context = context;
        }

        public IEnumerable<Employees> ListaEmpleados()
        {
            return _context.Employees.ToList();
        }

        public bool AgregarEmpleado(EmpleadosDTO empleadoDTO)
        {
            Employees empleado = new Employees();
            bool agregado = false;
            try
            {
                empleado.FirstName = empleadoDTO.FirstName;
                empleado.LastName = empleadoDTO.LastName;
                empleado.Title = empleadoDTO.Title;
                empleado.TitleOfCourtesy = empleadoDTO.TitleOfCourtesy;
                empleado.BirthDate = empleadoDTO.BirthDate;
                empleado.HireDate = empleadoDTO.HireDate;
                empleado.Address = empleado.Address;
                empleado.City = empleadoDTO.City;
                empleado.Country = empleadoDTO.Country;
                empleado.Notes = empleadoDTO.Notes;
                empleado.HomePhone = empleadoDTO.HomePhone;
                empleado.Extension = empleadoDTO.Extension;
                empleado.Photo = empleadoDTO.Photo;
                empleado.PhotoPath = empleadoDTO.PhotoPath;
                empleado.PostalCode = empleadoDTO.PostalCode;
                empleado.Region = empleadoDTO.Region;

                _context.Employees.Add(empleado);

                if (_context.SaveChanges() > 0)
                    agregado = true;
            }
            catch (Exception)
            {
                
                throw;
            }
            return agregado;
        }

        public List<Employees> BuscarEmpleados(string texto)
        {
            return _context.Employees.Where(em => em.LastName.Contains(texto) 
                    || em.FirstName.Contains(texto)).ToList();
        }

        public Employees ObtenerEmpleado(string parmId)
        {
            Employees empleado = null;
            try
            {
                int id;
                bool convertido = int.TryParse(parmId, out id);

                if (!convertido)
                    return null;

                empleado =  _context.Employees
                .FirstOrDefault(em => em.EmployeeID == id);
            }
            catch (Exception)
            {
                return null;
            }

            return empleado;
        }

        public bool EliminarEmpleado(int id)
        {
            bool eliminado = false;
            Employees empleado = ObtenerEmpleado(id.ToString());

            if (empleado != null)
            {
                try
                {
                    _context.Employees.Remove(empleado);
                    if(_context.SaveChanges() > 0)
                    eliminado = true;
                }
                catch (Exception) { }
            }
            return eliminado;
        }

        public bool EditarEmpleado(string idEmpleado, EmpleadosDTO empleadoDTO)
        {
            Employees empleado = ObtenerEmpleado(idEmpleado);
            bool editado = false;
            if(empleado != null)
            {
                empleado.FirstName = empleadoDTO.FirstName;
                empleado.LastName = empleadoDTO.LastName;
                empleado.Title = empleadoDTO.Title;
                empleado.TitleOfCourtesy = empleadoDTO.TitleOfCourtesy;
                empleado.BirthDate = empleadoDTO.BirthDate;
                empleado.HireDate = empleadoDTO.HireDate;
                empleado.Address = empleado.Address;
                empleado.City = empleadoDTO.City;
                empleado.Country = empleadoDTO.Country;
                empleado.Notes = empleadoDTO.Notes;
                empleado.HomePhone = empleadoDTO.HomePhone;
                empleado.Extension = empleadoDTO.Extension;
                empleado.Photo = empleadoDTO.Photo;
                empleado.PhotoPath = empleadoDTO.PhotoPath;
                empleado.PostalCode = empleadoDTO.PostalCode;
                empleado.Region = empleadoDTO.Region;

                if (_context.SaveChanges() > 0)
                    editado = true;
            }

            return editado;
        }
    }
}