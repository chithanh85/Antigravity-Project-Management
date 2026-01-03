# Antigravity PM - Hướng Dẫn Sử Dụng

# English Below

**Antigravity Project Management (APM)** là một workspace template với pre-commit hooks đa ngôn ngữ và quy trình quản lý dự án tự động.

## 🚀 Cài Đặt Nhanh

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
- Thiết lập git hooks

## 📁 Cấu Trúc Thư Mục

```text
.antigravity/
├── 0-analysis/         # Product Briefs & Research
├── 1-planning/         # Technical Specifications
└── 2-execution/        # Epics & Tasks

.agent/workflows/       # APM workflows (đừng sửa)
scripts/                # Utility scripts
docs/                   # Documentation
```

## 🔧 Pre-commit Hooks (Tự Động)

Khi bạn `git commit`, hệ thống sẽ **tự động** chạy:

### ✅ Markdown Projects

- `markdownlint` trên các file `.md` đã staged

### ✅ Node.js/TypeScript Projects

- `npm run lint` hoặc `npm run lint-all`
- `npm run format:check` (nếu có)
- `npm test` (nếu có)

### ✅ Python Projects

- `pylint` trên các file `.py` đã staged
- `black --check` (nếu có cài)
- `pytest` (nếu có cài)

### ✅ Go Projects

- `golangci-lint run ./...`
- `gofmt` check
- `go test ./...`

**Lưu ý**: Chỉ chạy checks cho ngôn ngữ có trong project của bạn!

## 📝 Quy Trình APM (Tùy Chọn)

### Phase 1: Analysis (VN)

```bash
# Tạo Product Brief
# Chạy workflow: /apm-brief
```

### Phase 2: Planning (VN)

```bash
# Tạo Technical Spec
# Chạy workflow: /apm-spec
```

### Phase 3: Execution (VN)

```bash
# Tạo Tasks
# Chạy workflow: /apm-build
```

### Auto-Pilot (All-in-One) (VN)

```bash
# Chạy toàn bộ pipeline
# Chạy workflow: /apm-flow
```

## 🛠️ Scripts Hữu Ích

```bash
# Phát hiện môi trường
npm run detect-env

# Khởi tạo APM structure
npm run apm-init

# Lint markdown files
npm run lint
```

## 🔍 Troubleshooting (VN)

### Pre-commit hook bị lỗi? (VN)

```bash
# Kiểm tra script có executable không
chmod +x scripts/pre-commit-check.sh

# Test thủ công
bash scripts/pre-commit-check.sh
```

### Muốn skip pre-commit hook? (VN)

```bash
git commit --no-verify -m "message"
```

### Muốn tắt một số checks? (VN)

Sửa file `scripts/pre-commit-check.sh` và comment out phần không cần.

## 📚 Tài Liệu Chi Tiết

- [APM Methodology](docs/README.md) - Quy trình chi tiết
- [Knowledge Base](docs/knowledge.md) - Best practices & lessons learned
- [Workflows](.agent/workflows/) - Các workflow có sẵn

## 🤝 Đóng Góp

Template này được tối ưu cho:

- ✅ Cross-platform (Windows, WSL, Linux, macOS)
- ✅ Multi-language (Node.js, Python, Go)
- ✅ Minimal dependencies (chỉ 2 npm packages)
- ✅ Fast setup (< 10 giây)

Nếu bạn muốn thêm ngôn ngữ khác (Rust, Java, etc.), sửa file `scripts/pre-commit-check.sh`.

---

# Antigravity PM - User Guide

**Antigravity Project Management (APM)** is a workspace template with multi-language pre-commit hooks and automated project management workflows.

## 🚀 Quick Setup

### 1. Clone or Copy Template

```bash
git clone <repo-url>
cd antigravity-pm
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Initialize APM

```bash
npm run apm-init
```

This will:

- Auto-detect environment (Windows/WSL/Linux/macOS)
- Create `.antigravity/` directory structure
- Set up git hooks

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
- `npm run format:check` (if available)
- `npm test` (if available)

### ✅ Python Projects (EN)

- `pylint` on staged `.py` files
- `black --check` (if installed)
- `pytest` (if installed)

### ✅ Go Projects (EN)

- `golangci-lint run ./...`
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
