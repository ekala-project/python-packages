{
  lib,
  buildPythonPackage,
  pythonAtLeast,
  pythonOlder,
  fetchFromGitHub,
  isPyPy,

  # build-system
  flit-core,

  # dependencies
  babel,
  alabaster,
  docutils,
  imagesize,
  jinja2,
  packaging,
  pygments,
  requests,
  roman-numerals,
  snowballstemmer,
  sphinxcontrib-applehelp,
  sphinxcontrib-devhelp,
  sphinxcontrib-htmlhelp,
  sphinxcontrib-jsmath,
  sphinxcontrib-qthelp,
  sphinxcontrib-serializinghtml,
  sphinxcontrib-websupport,
}:

buildPythonPackage rec {
  pname = "sphinx";
  version = "9.1.0";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "sphinx-doc";
    repo = "sphinx";
    tag = "v${version}";
    postFetch = ''
      # Change ä to æ in file names, since ä can be encoded multiple ways on different
      # filesystems, leading to different hashes on different platforms.
      cd "$out";
      mv tests/roots/test-images/{testimäge,testimæge}.png
      sed -i 's/testimäge/testimæge/g' tests/{test_build*.py,roots/test-images/index.rst}
    '';
    hash = "sha256-PgqjCeyHOhWtZjyzSZyvsPT0Q7yRyNDiW3x1fQq0K+8=";
  };

  build-system = [ flit-core ];

  dependencies = [
    alabaster
    babel
    docutils
    imagesize
    jinja2
    packaging
    pygments
    requests
    roman-numerals
    snowballstemmer
    sphinxcontrib-applehelp
    sphinxcontrib-devhelp
    sphinxcontrib-htmlhelp
    sphinxcontrib-jsmath
    sphinxcontrib-qthelp
    sphinxcontrib-serializinghtml
    # extra[docs]
    sphinxcontrib-websupport
  ];

  pythonRelaxDeps = [ "docutils" ];
  disabledTestPaths = lib.optionals isPyPy [
    # internals are asserted which are sightly different in PyPy
    "tests/test_ext_autodoc/test_ext_autodoc.py"
    "tests/test_ext_autodoc/test_ext_autodoc_autoclass.py"
    "tests/test_ext_autodoc/test_ext_autodoc_autofunction.py"
    "tests/test_ext_autodoc/test_ext_autodoc_automodule.py"
    "tests/test_ext_autodoc/test_ext_autodoc_preserve_defaults.py"
    "tests/test_util/test_util_inspect.py"
    "tests/test_util/test_util_typing.py"
  ];
  meta = {
    description = "Python documentation generator";
    longDescription = ''
      Sphinx makes it easy to create intelligent and beautiful documentation.

      Here are some of Sphinx’s major features:
      - Output formats: HTML (including Windows HTML Help), LaTeX (for printable
        PDF versions), ePub, Texinfo, manual pages, plain text
      - Extensive cross-references: semantic markup and automatic links for
        functions, classes, citations, glossary terms and similar pieces of
        information
      - Hierarchical structure: easy definition of a document tree, with
        automatic links to siblings, parents and children
      - Automatic indices: general index as well as a language-specific module
        indices
      - Code handling: automatic highlighting using the Pygments highlighter
      - Extensions: automatic testing of code snippets, inclusion of docstrings
        from Python modules (API docs) via built-in extensions, and much more
        functionality via third-party extensions.
      - Themes: modify the look and feel of outputs via creating themes, and
        re-use many third-party themes.
      - Contributed extensions: dozens of extensions contributed by users; most
        of them installable from PyPI.

      Sphinx uses the reStructuredText markup language by default, and can read
      MyST markdown via third-party extensions. Both of these are powerful and
      straightforward to use, and have functionality for complex documentation
      and publishing workflows. They both build upon Docutils to parse and write
      documents.
    '';
    homepage = "https://www.sphinx-doc.org";
    license = lib.licenses.bsd3;
  };
}
