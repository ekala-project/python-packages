{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  ipykernel,
  ipython,
  jupyter-client,
  jupyter-core,
  prompt-toolkit,
  pygments,
  pyzmq,
  traitlets,
}:

buildPythonPackage rec {
  pname = "jupyter-console";
  version = "6.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter";
    repo = "jupyter_console";
    tag = "v${version}";
    hash = "sha256-jdSeZCspcjEQVBpJyxVnwJ5SAq+SS1bW9kqp/F/zwCQ=";
  };

  postPatch =
    # Use wrapped executable in tests
    let
      binPath = "${placeholder "out"}/bin/jupyter-console";
    in
    ''
      substituteInPlace jupyter_console/tests/test_console.py \
        --replace-fail "'-m', 'jupyter_console', " "" \
        --replace-fail "sys.executable" "'${binPath}'"
    '';

  build-system = [ hatchling ];

  dependencies = [
    ipykernel
    ipython
    jupyter-client
    jupyter-core
    prompt-toolkit
    pygments
    pyzmq
    traitlets
  ];

  pythonImportsCheck = [ "jupyter_console" ];
  meta = {
    description = "Jupyter terminal console";
    mainProgram = "jupyter-console";
    homepage = "https://github.com/jupyter/jupyter_console";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
