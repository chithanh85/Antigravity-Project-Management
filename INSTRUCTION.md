# Antigravity PM - Hệ Sinh Thái Quản Lý Dự Án Thông Minh & Bảo Mật

**Antigravity Project Management (APM)** là một phương pháp luận quản lý dự án hiện đại, kết hợp giữa tư duy hệ thống và tự động hóa hiệu suất cao. APM giúp các đội ngũ phát triển chuyển hóa ý tưởng từ sơ khai thành sản phẩm thực tế thông qua một quy trình khoa học, tinh gọn, minh bạch và an toàn tuyệt đối.

## ⚡ Cài Đặt Nhanh (One-Click Setup)

Để bắt đầu ngay lập tức với cấu trúc chuẩn:

- **Windows**: Chạy file `setup.bat`
- **Linux/macOS/WSL**: Chạy lệnh `bash setup.sh`

Các script này sẽ tự động cài đặt dependencies và khởi tạo môi trường APM cho bạn.

---

## 🌊 Luồng Công Việc Cốt Lõi (Core Workflow)

APM vận hành dựa trên chuỗi giá trị 4 giai đoạn, đảm bảo mọi dòng mã đều có mục đích và được kiểm soát chất lượng tự động:

1.  **Phân Tích (Analysis) `/apm-brief`**: Đào sâu yêu cầu, nghiên cứu tài liệu và xác định "Tại sao" chúng ta xây dựng tính năng này.
2.  **Lập Kế Hoạch (Planning) `/apm-spec`**: Thiết kế kiến trúc tổng thể, đặc tả kỹ thuật và xác định "Làm thế nào" để tối ưu hóa.
3.  **Thực Thi (Execution) `/apm-build`**: Chia nhỏ Spec thành các Task nguyên tử, thực thi mã nguồn và kiểm soát chất lượng/bảo mật tự động.
4.  **Chế Độ Tự Động (Auto-Pilot) `/apm-flow`**: Tự động hóa toàn bộ hành trình từ Ý tưởng đến Code chỉ với một lệnh duy nhất.

---

## � Cài Đặt Nhanh

### 1. Clone hoặc Copy Template

```bash
git clone <repo-url>
cd antigravity-pm
```

### 2. Cài Đặt Dependencies

```bash
npm install
```

### 3. Khởi Tạo APM

```bash
npm run apm-init
```

Lệnh này sẽ:

- Tự động phát hiện môi trường (Windows/WSL/Linux/macOS)
- Tạo cấu trúc thư mục `.antigravity/`
- Thiết lập hệ thống Git Hooks thông minh

---

## 🔧 Pre-commit Hooks (Tự động)

Khi bạn thực hiện `git commit`, hệ thống sẽ **tự động** chạy:

### ✅ Dự án Markdown
- `markdownlint` trên các file `.md` đang được stage.

### ✅ Dự án Node.js/TypeScript
- `npm run lint` hoặc `npm run lint-all`
- `npm run lint:security` (Quét lỗi bảo mật tĩnh)
- `npm run audit:check` (Quét lỗ hổng dependency)
- `npm run format:check` (nếu có)
- `npm test` (nếu có)

### ✅ Dự án Python
- `pylint` trên các file `.py` đang được stage.
- `bandit` (Quét lỗi bảo mật tĩnh)
- `safety check` & `pip-audit` (Quét lỗ hổng dependency)
- `black --check` (nếu cài đặt)
- `pytest` (nếu cài đặt)

### ✅ Dự án Go
- `golangci-lint run ./...`
- `gosec` (Quét lỗi bảo mật tĩnh)
- `govulncheck` (Quét lỗ hổng dependency)
- `gofmt` check
- `go test ./...`

**Lưu ý**: Chỉ chạy các kiểm tra cho ngôn ngữ hiện có trong dự án của bạn!

## 🛠️ Script Hữu Ích

```bash
# Phát hiện môi trường
npm run detect-env

# Khởi tạo cấu trúc APM
npm run apm-init

# Kiểm tra markdown
npm run lint

# Kiểm tra & Fix bảo mật
npm run audit:check
npm run audit:fix
npm run lint:security
```

---

# Antigravity PM - Intelligent & Secure Automated Project Management

**Antigravity Project Management (APM)** is a modern project management methodology that bridges the gap between systemic thinking and high-performance automation. APM empowers development teams to transform raw ideas into production-ready products through a scientific, lean, transparent, and secure workflow.

## ⚡ One-Click Setup

To get started immediately with the standard structure:

- **Windows**: Run `setup.bat`
- **Linux/macOS/WSL**: Run `bash setup.sh`

These scripts will automatically install dependencies and initialize the APM ecosystem for you.

---

## 🌊 Core Workflow

APM operates on a 4-phase value chain, ensuring every line of code serves a clear purpose and undergoes automated quality/security control:

1.  **Phase 1: Analysis `/apm-brief`**: Deep-dive into requirements, research documentation, and define the "Why" behind every feature.
2.  **Phase 2: Planning `/apm-spec`**: Design overall architecture, technical specifications, and define "How" to implement optimally.
3.  **Phase 3: Execution `/apm-build`**: Decompose Specs into atomic Tasks, execute source code, and enforce automated quality/security control.
4.  **Phase 4: Auto-Pilot `/apm-flow`**: Automate the entire journey from Idea to Code with a single orchestrated command.

---

## 📁 Directory Structure

```text
.antigravity/
├── 0-analysis/         # Product Briefs & Research
├── 1-planning/         # Technical Specifications
└── 2-execution/        # Epics & Tasks

.agent/workflows/       # APM workflows (don't modify)
scripts/                # Utility scripts
docs/                   # Documentation
```

## 🔧 Pre-commit Hooks (Automatic)

When you `git commit`, the system will **automatically** run:

### ✅ Markdown Projects (EN)

- `markdownlint` on staged `.md` files

### ✅ Node.js/TypeScript Projects (EN)

- `npm run lint` or `npm run lint-all`
- `npm run lint:security` (Security-focused static analysis)
- `npm run audit:check` (Dependency vulnerability scan)
- `npm run format:check` (if available)
- `npm test` (if available)

### ✅ Python Projects (EN)

- `pylint` on staged `.py` files
- `bandit` (Security static analysis)
- `safety check` & `pip-audit` (Dependency vulnerability scan)
- `black --check` (if installed)
- `pytest` (if installed)

### ✅ Go Projects (EN)

- `golangci-lint run ./...`
- `gosec` (Security-focused linting)
- `govulncheck` (Vulnerability scanning)
- `gofmt` check
- `go test ./...`

**Note**: Only runs checks for languages present in your project!

## 📝 APM Workflow (Optional)

### Phase 1: Analysis (EN)

```bash
# Create Product Brief
# Run workflow: /apm-brief
```

### Phase 2: Planning (EN)

```bash
# Create Technical Spec
# Run workflow: /apm-spec
```

### Phase 3: Execution (EN)

```bash
# Create Tasks
# Run workflow: /apm-build
```

### Auto-Pilot (All-in-One) (EN)

```bash
# Run entire pipeline
# Run workflow: /apm-flow
```

## 🛠️ Useful Scripts (EN)

```bash
# Detect environment
npm run detect-env

# Initialize APM structure
npm run apm-init

# Lint markdown files
npm run lint

# Security audit & fixes
npm run audit:check
npm run audit:fix
npm run lint:security
```

## 🔍 Troubleshooting (EN)

### Pre-commit hook failing?

```bash
# Check if script is executable
chmod +x scripts/pre-commit-check.sh

# Test manually
bash scripts/pre-commit-check.sh
```

### Want to skip pre-commit hook?

```bash
git commit --no-verify -m "message"
```

### Want to disable some checks?

Edit `scripts/pre-commit-check.sh` and comment out unwanted sections.

## 📚 Detailed Documentation (EN)

- [APM Methodology](docs/README.md) - Detailed workflow
- [Knowledge Base](docs/knowledge.md) - Best practices & lessons learned
- [Workflows](.agent/workflows/) - Available workflows

## 🤝 Contributing

This template is optimized for:

- ✅ Cross-platform (Windows, WSL, Linux, macOS)
- ✅ Multi-language (Node.js, Python, Go)
- ✅ Minimal dependencies (only 2 npm packages)
- ✅ Fast setup (< 10 seconds)

To add other languages (Rust, Java, etc.), edit `scripts/pre-commit-check.sh`.

## 📄 License

ISC
