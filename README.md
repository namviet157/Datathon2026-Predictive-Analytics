Dự án gồm 3 notebook Jupyter, bao gồm:

```
├── 01_MC.ipynb       # Trả lời câu hỏi trắc nghiệm
├── 02_EDA.ipynb      # Phân tích dữ liệu khám phá
└── 03_model.ipynb    # Dự đoán doanh thu 2023–2024
```

---

## Hướng Dẫn Chạy

### `01_MC.ipynb`
Notebook này xử lý và trả lời các câu hỏi trắc nghiệm.

```bash
jupyter notebook 01_MC.ipynb
```

> Chạy toàn bộ các cell theo thứ tự từ trên xuống dưới (**Run All**).

---

### `02_EDA.ipynb` 

Notebook này thực hiện phân tích khám phá dữ liệu (EDA), bao gồm trực quan hóa, thống kê mô tả, kiểm định, và hồi quy tương quan.

```bash
jupyter notebook 02_EDA.ipynb
```

> Đảm bảo dữ liệu đầu vào đã được đặt đúng đường dẫn trước khi chạy.

---

### `03_model.ipynb` 

Notebook này xây dựng mô hình dự đoán doanh thu cho giai đoạn 2023–2024.

```bash
jupyter notebook 03_model.ipynb
```

---

## Lưu Ý
- Nếu gặp lỗi thiếu thư viện, chạy lệnh `pip install` kèm các thư viện còn thiếu.
- Kết quả dự đoán sẽ được lưu/hiển thị ở cuối notebook `03_model.ipynb`.
