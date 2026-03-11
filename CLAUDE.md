# Presentations Repository

Technical presentations for talks on AI, DevOps, ML, Rust, programming languages, and related topics.

## Project Structure

- Each presentation lives in its own directory: `<topic_name>/`
- Directory names use `snake_case` (e.g., `customer_support_using_ai/`)
- Each directory contains the `.org` source, generated `.tex`, `.pdf`, and any assets (plots, images)

## Document Format

- **Primary format**: Emacs Org-Mode (`.org` files)
- **Export target**: LaTeX Beamer for slide PDFs
- Org headers: `#+title:`, `#+options: tex:t author:nil date:nil` (adjust per presentation)
- Use `#+begin_src` blocks for code examples with appropriate language tags
- Use LaTeX equations inline (`\( ... \)`) or display (`\begin{equation}...\end{equation}`)
- Embed images with org links: `[[./plots/filename.png]]`

## Diagramming & Visuals

- **Prefer TikZ** for all diagrams — architecture, flowcharts, graphs, timelines, etc.
- Embed TikZ directly in org-babel latex blocks for seamless PDF export
- Use Python matplotlib via org-babel blocks only for data-driven plots (charts, histograms, scatter plots)
- Store generated images in a `plots/` subdirectory within the presentation directory
- Prefer code-generated diagrams over static images for reproducibility

## Org-Mode Rules

- Always align org tables before committing `.org` files (see global CLAUDE.md for the Emacs batch command)
- Keep slide content concise — bullet points, not paragraphs
- Use org heading levels for slide structure (`*` = section, `**` = slide, `***` = sub-points)

## Content Guidelines

- Target audience: technical professionals and developers
- Include working code examples wherever possible
- Add speaker notes under `:NOTES:` drawers when helpful
- Keep math/formulas readable — explain notation before using it

## When Creating a New Presentation

1. Create a new directory: `mkdir <presentation_name>/`
2. Create the `.org` file inside it with matching name
3. Create `plots/` subdirectory if diagrams are needed
4. Add a `.envrc` with `use nix` or `use flake` if the presentation needs specific tooling (Python, etc.)
