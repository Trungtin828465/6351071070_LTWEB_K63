using BOOK.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Web.UI;
using System.IO;
using System.Data.Entity.Migrations;

namespace BOOK.Controllers
{
    public class AdminController : Controller
    {
        QlsachEntities10 db = new QlsachEntities10();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult Sach(int? page)
        //{
        //    int pageSize = 4;
        //    int pageNum = (page ?? 1);
        //    // Retrieve the 5 latest books

        //    return View(db.SACHes.ToList().OrderBy(n => n.MaSach).ToPagedList(pageNum, pageSize));
        //}
        public ActionResult Sach(int? page)
        {
            int pageSize = 4; // Số lượng sách mỗi trang
            int pageNum = (page ?? 1); // Trang hiện tại, mặc định là 1 nếu không có giá trị

            // Lọc sách có tmp = 0 và sắp xếp theo MaSach
            var sachList = db.SACHes
                             .Where(s => s.tmp == 0)
                             .OrderBy(n => n.MaSach)
                             .ToPagedList(pageNum, pageSize);

            return View(sachList);
        }




        [HttpGet]

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                // Gán giá trị cho đối tượng được tạo mới (ad)
                Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PasswordAdmin == matkhau);
                if (ad != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult Themmoisach()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaNXB = new SelectList(db.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            ViewBag.MaTG = new SelectList(db.TACGIAs.ToList().OrderBy(n => n.TenTG), "MaTG", "TenTG");

            return View();
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoisach(SACH sach, HttpPostedFileBase fileUpload)
        {
            // Dua du lieu vao dropdownlist
            ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaTG = new SelectList(db.TACGIAs.ToList().OrderBy(n => n.TenTG), "MaTG", "TenTG");
            ViewBag.MaNXB = new SelectList(db.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            // Kiem tra duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            // Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    // Luu ten file, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    // Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/Hinhsanpham"), fileName);
                    // Kiem tra hinh anh ton tai chua?
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        // Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    sach.AnhBia = fileName;
                    sach.tmp = 0;
                    // Sử dụng phương thức Add để thêm vào CSDL
                    db.SACHes.Add(sach);
                    db.SaveChanges();
                }
                return RedirectToAction("Sach");
            }
        }
        [HttpGet]
        public ActionResult Suasach(int id)
        {
            // Tìm sách dựa trên MaSach
            SACH sach = db.SACHes.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404; // Trả về mã lỗi 404
                return HttpNotFound("Không tìm thấy sách yêu cầu."); // Trả về thông báo lỗi
            }

            ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            ViewBag.MaNXB = new SelectList(db.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            ViewBag.MaTG = new SelectList(db.TACGIAs.ToList().OrderBy(n => n.TenTG), "MaTG", "TenTG");

            return View(sach);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasach(SACH sach, HttpPostedFileBase fileUpload)
        {
            //Dua du lieu vao dropdownlist
            ViewBag.MaCD = new SelectList(db.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaNXB = new SelectList(db.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            ViewBag.MaTG = new SelectList(db.TACGIAs.ToList().OrderBy(n => n.TenTG), "MaTG", "TenTG");

            //Kiem tra duong dan file
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View(sach);
            }
            //Them vao CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Luu ten file, luu y bo sung thu vien using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Luu duong dan cua file
                    var path = Path.Combine(Server.MapPath("~/Hinhsanpham"), fileName);
                    //Kiem tra hinh anh ton tai chua?
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        return View(sach);
                    }

                    else
                    {
                        //Luu hinh anh vao duong dan
                        fileUpload.SaveAs(path);
                    }
                    sach.AnhBia = fileName;
                    //Luu vao CSDL
                    //UpdateModel(sach);
                    db.SACHes.AddOrUpdate(sach);
                    db.SaveChanges();
                }
                return RedirectToAction("Sach");
            }
        }

        public ActionResult Chitietsach(int id)
        {
            // Tìm sách dựa trên MaSach
            SACH sach = db.SACHes.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404; // Trả về mã lỗi 404
                return HttpNotFound("Không tìm thấy sách yêu cầu."); // Trả về thông báo lỗi
            }


            return View(sach);
        }
        [HttpGet]
        public ActionResult Xoasach(int id)
        {
            // Tìm sách dựa trên MaSach
            SACH sach = db.SACHes.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404; // Trả về mã lỗi 404
                return HttpNotFound("Không tìm thấy sách yêu cầu."); // Trả về thông báo lỗi
            }


            return View(sach);
        }
        [HttpPost, ActionName("Xoasach")]
        public ActionResult Xacnhanxoa(int id)
        {
            SACH sach = db.SACHes.SingleOrDefault(n => n.MaSach == id);
            ViewBag.Masach = sach.MaSach;
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            sach.tmp = 1;

            db.SaveChanges();
            return RedirectToAction("Sach");
        }

        public ActionResult ThongKe()
        {
            var booksByCategory = db.SACHes
   .GroupBy(s => s.CHUDE.TenChuDe)  // Assuming `Tenchude` is the category name in CHUDE
   .Select(g => new { Category = g.Key, Count = g.Count() })
   .ToList();

            ViewBag.ChartLabels = booksByCategory.Select(b => b.Category).ToArray();
            ViewBag.ChartData = booksByCategory.Select(b => b.Count).ToArray();

            return View();
        }





    }
}