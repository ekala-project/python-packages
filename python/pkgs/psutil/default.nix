{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  gitUpdater,
}:

buildPythonPackage rec {
  pname = "psutil";
  version = "7.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "giampaolo";
    repo = "psutil";
    tag = "release-${version}";
    hash = "sha256-plBv24QgNzmVMV2lFxCbNwHKtd620thJayWdjs4estw=";
  };

  postPatch = ''
    # stick to the old SDK name for now
    # https://developer.apple.com/documentation/iokit/kiomasterportdefault/
    # https://developer.apple.com/documentation/iokit/kiomainportdefault/
    substituteInPlace psutil/arch/osx/cpu.c \
      --replace-fail kIOMainPortDefault kIOMasterPortDefault
  '';

  build-system = [ setuptools ];
  # Segfaults on darwin:
  # https://github.com/giampaolo/psutil/issues/1715
  doCheck = !stdenv.hostPlatform.isDarwin;

  # In addition to the issues listed above there are some that occure due to
  # our sandboxing which we can work around by disabling some tests:
  # - cpu_times was flaky on darwin
  # - the other disabled tests are likely due to sandboxing (missing specific errors)
  pythonImportsCheck = [ "psutil" ];

  passthru.updateScript = gitUpdater {
    rev-prefix = "release-";
  };

  meta = {
    description = "Process and system utilization information interface";
    homepage = "https://github.com/giampaolo/psutil";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
