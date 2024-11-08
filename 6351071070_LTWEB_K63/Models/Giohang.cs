using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOOK.Models
{
    public class Giohang
    {
        // Tạo đối tượng data chứa dữ liệu từ model dbBansach đã tạo.
        QlsachEntities data = new QlsachEntities();

        public int iMasach { get; set; }
        public string sTensach { get; set; }
        public string sAnhbia { get; set; }
        public double dDongia { get; set; }
        public int iSoluong { get; set; }

        public double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }

        // Khởi tạo giỏ hàng theo Masach được truyền vào với Soluong mặc định là 1
        public Giohang(int Masach)
        {
            iMasach = Masach;
            SACH sach = data.SACHes.Single(n => n.MaSach == iMasach);
            sTensach = sach.TenSach;
            sAnhbia = sach.AnhBia;
            dDongia = double.Parse(sach.GiaBan.ToString());
            iSoluong = 1;
        }
    }

}