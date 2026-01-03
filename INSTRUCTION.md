# Antigravity PM - Hệ Sinh Thái Quản Lý Dự Án Tự Động

**Antigravity Project Management (APM)** là một phương pháp luận quản lý dự án hiện đại, kết hợp giữa tư duy hệ thống và tự động hóa mạnh mẽ. APM giúp các đội ngũ phát triển chuyển hóa những ý tưởng sơ khai thành sản phẩm thực tế thông qua một quy trình khoa học, tinh gọn và minh bạch.

# English Below

**Chào mừng bạn đến với quy trình làm việc Antigravity Project Management Workflow.** 

## 🌊 Flow Làm Việc (Workflow)

APM vận hành dựa trên chuỗi giá trị 3 giai đoạn cốt lõi, đảm bảo mọi dòng mã đều có mục đích rõ ràng:

1.  **Phân Tích (Analysis) `/apm-brief`**: Đào sâu yêu cầu, nghiên cứu tài liệu và xác định "Tại sao" chúng ta xây dựng tính năng này.
2.  **Lập Kế Hoạch (Planning) `/apm-spec`**: Thiết kế kiến trúc tổng thể, đặc tả kỹ thuật và xác định "Làm thế nào" để triển khai tối ưu nhất.
3.  **Thực Thi (Execution) `/apm-build`**: Chia nhỏ Spec thành các Task nhỏ gọn, thực thi mã nguồn và kiểm soát chất lượng tự động.
4.  **Chế Độ Tự Động (Auto-Pilot) `/apm-flow`**: Tự động hóa toàn bộ hành trình từ Idea đến Code chỉ với một lệnh duy nhất.

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

# Antigravity PM - Automated Project Management Ecosystem

**Antigravity Project Management (APM)** is a modern project management methodology that bridges the gap between systemic thinking and high-performance automation. APM empowers development teams to transform raw ideas into production-ready products through a scientific, lean, and transparent workflow.

**Welcome to the Antigravity Project Management Workflow.**

## 🌊 Core Workflow

APM operates on a 3-phase value chain, ensuring every line of code serves a clear purpose:

1.  **Phase 1: Analysis `/apm-brief`**: Deep-dive into requirements, research documentation, and define the "Why" behind every feature.
2.  **Phase 2: Planning `/apm-spec`**: Design overall architecture, technical specifications, and define "How" to implement optimally.
3.  **Phase 3: Execution `/apm-build`**: Decompose Specs into atomic Tasks, execute source code, and enforce automated quality control.
4.  **Auto-Pilot Mode `/apm-flow`**: Automate the entire journey from Idea to Code with a single orchestrated command.

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
