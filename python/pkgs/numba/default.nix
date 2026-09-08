{
  lib,
  stdenv,
  fetchFromGitHub,
  buildPythonPackage,

  # build-system
  setuptools,

  # dependencies
  llvmlite,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  version = "0.67.0";
  pname = "numba";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "numba";
    repo = "numba";
    tag = finalAttrs.version;
    # Upstream uses .gitattributes to inject information about the revision
    # hash and the refname into `numba/_version.py`, see:
    #
    # - https://git-scm.com/docs/gitattributes#_export_subst and
    # - https://github.com/numba/numba/blame/5ef7c86f76a6e8cc90e9486487294e0c34024797/numba/_version.py#L25-L31
    postFetch = ''
      sed -i 's/git_refnames = "[^"]*"/git_refnames = " (tag: ${finalAttrs.src.tag})"/' $out/numba/_version.py
    '';
    hash = "sha256-xQFJSO9kcRwyNx/G/ALQXZWE6+4wL1Dz+5kIDXK5Eow=";
  };

  postPatch = ''
    substituteInPlace numba/__init__.py \
      --replace-fail "(2, 5)" "(2, 6)"
  '';

  build-system = [
    setuptools
    numpy
  ];

  pythonRelaxDeps = [
    "numpy"
  ];

  dependencies = [
    numpy
    llvmlite
  ];

  pythonImportsCheck = [ "numba" ];

  meta = {
    description = "Compiling Python code using LLVM";
    homepage = "https://numba.pydata.org/";
    license = lib.licenses.bsd2;
    mainProgram = "numba";
    maintainers = [ ];
  };
})
