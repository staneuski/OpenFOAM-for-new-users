# Описание OpenFOAM-for-new-users
Репозиторий создан для помощи в освоении [OpenFOAM](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/About) незнакомым с этой средой человеком.

Обучающие кейсы можно найти в [**OpenFOAM-for-new-users.Wiki**](https://github.com/StasF1/OpenFOAM-for-new-users/wiki) – вики данного репозитория.

# Требования
- [OpenFOAM v6](https://openfoam.org/download/) (для большинства проектов)
- [OpenFOAM-extend-3.0](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Extend#openfoam-extend-30) с установленными [DensityBasedTurbo](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Additions#densitybasedturbo) и [OpenFOAM-extend-4.0](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Extend#openfoam-extend-40) и (для проекта [_bladeMachines/_](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/tutorials/bladeMachines))

# [История версий](https://github.com/StasF1/dualFuelEngine/releases)
| Версия | Описание | Скачать архив 📥 |
|-------:|----------|------------------|
| [v0.1-beta](https://github.com/StasF1/OpenFOAM-for-new-users/tree/v0.1.1-beta) | Созданы проекты *bladeMachines*/, *cloneExistingSolver/*, *snappyHexMesh*/ | [.tar.gz](https://github.com/StasF1/OpenFOAM-for-new-users/archive/v0.1.1-beta.tar.gz), [.zip](https://github.com/StasF1/OpenFOAM-for-new-users/archive/v0.1.1-beta.zip) |

# Структура
```gitignore
OpenFOAM-for-new-users-0.1-beta
├── doc # файлы, ссылки и проч.
│   ├── images
│   │   ├── bladeMachines
│   │   ├── smoothingInParaView
│   │   └── snappyHexMesh
│   └── references
├── etc # скрипты устанавливающие OpenFOAM (от v4.x до v7), его расширенные версии и дополнения
└── tutorials # обучающие проекты, описание которых можно найти в Wiki репозитория
    ├── bladeMachines
    │   ├── DensityBasedTurbo # требует дополнения DensityBasedTurbo к 1.6-ext или extend-4.0
    │   │   ├── AxialMixerMRFCHTSteadyState
    │   │   ├── AxialMixerMRFCHTUnsteady
    │   │   ├── AxialMixerMRFFSISteadyState
    │   │   ├── AxialRotorMRF
    │   │   ├── AxialRotorSRF
    │   │   ├── AxialStageMRFRotating
    │   │   ├── bumpMinf0675
    │   │   └── forwardStep
    │   └── extend-4.0 # требует OpenFOAM-extend-4.0
    │       ├── steadyCompressibleFoam
    │       │	├── 2bump
    │       │	└── transonicBump
    │       ├── steadyCompressibleMRFFoam
    │       │	├── axialRotorStatorMRF
    │       │	├── axialTurbineMixingPlane
    │       │	├── bentRotorStator
    │       │	└── simpleRotorStator
    │       ├── steadyCompressibleSRFFoam
    │       │	├── bentBlade
    │       │	└── simpleBlade
    │       └── steadyUniversalMRFFoam
    │           ├── axialTurbineGgiJump
    │           └── axialTurbineMixingPlane
    ├── cloneExistingSolver # протестирован на OpenFOAM v6
    │   ├── prism
    │   └── quadPiston
    └── snappyHexMesh # протестирован на OpenFOAM v5
        ├── case
        ├── geometry
        └── mesh
```