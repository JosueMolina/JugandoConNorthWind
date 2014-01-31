using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JugandoConNorthWind.ModeloNorthWind;

namespace JugandoConNorthWind.Repositorio
{
    public class ProveedoresRepositorio
    {
         protected NorthwindEntities _context;
         public ProveedoresRepositorio(NorthwindEntities context)
        {
            _context = context;
        }

         public IEnumerable<Suppliers> ListaProveedores()
         {
             var proveedores = _context.Suppliers.Where(p => p.SupplierID != 30).ToList();
             return proveedores;
         }

         public IEnumerable<Suppliers> BuscarProveedor(string text)
         {
             var proveedores = _context.Suppliers.Where(p => p.CompanyName.Contains(text)).Where(p => p.SupplierID != 30).ToList();
             return proveedores;
         }

        public Suppliers ObtenerProveedor(string Parmid)
        {
            Suppliers proveedor = null;
            try
            {
                int id;
                bool convertido = int.TryParse(Parmid, out id);
                if (!convertido)
                    return null;

                proveedor = _context.Suppliers.Where(p => p.SupplierID == id).FirstOrDefault();
            }
            catch (Exception)
            {
                proveedor = null;
            }

            return proveedor;
        }


        public bool RemoverProveedor(int id)
        {
            bool removido = false;

            try
            {
                Suppliers proveedor = ObtenerProveedor(id.ToString());
                if (proveedor != null)
                {
                    List<Products> Productos = _context.Products
                                               .Where(pro => pro.SupplierID == proveedor.SupplierID)
                                               .ToList();

                    Productos.ForEach(pro => pro.SupplierID = 30);

                    _context.Suppliers.Remove(proveedor);

                    _context.SaveChanges();

                    removido = true;
                }
            }
            catch (Exception)
            {
                
            }

            return removido;
        }
    }
}