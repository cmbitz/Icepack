!=======================================================================

! Defines the domain size and number of categories and layers.
!
! author Elizabeth C. Hunke, LANL

      module icedrv_domain_size

      use icedrv_kinds

!=======================================================================

      implicit none
      private

      integer (kind=int_kind), parameter, public :: &
        nx        = NXGLOB    , & ! vector length
        nfsd      = NFSDCAT   , & ! number of floe size categories
        ncat      = NICECAT   , & ! number of categories
        nilyr     = NICELYR   , & ! number of ice layers per category
        nslyr     = NSNWLYR   , & ! number of snow layers per category
        n_iso     = NTRISO    , & ! number of isotopes in use
        n_aero    = NTRAERO   , & ! number of aerosols in use
        n_zaero   = TRZAERO   , & ! number of z aerosols in use
        n_algae   = TRALG     , & ! number of algae in use
        n_doc     = TRDOC     , & ! number of DOC pools in use
        n_dic     = TRDIC     , & ! number of DIC pools in use
        n_don     = TRDON     , & ! number of DON pools in use
        n_fed     = TRFED     , & ! number of Fe  pools in use dissolved Fe
        n_fep     = TRFEP     , & ! number of Fe  pools in use particulate Fe
        nfreq     = 25        , & ! number of wave frequencies ! HARDWIRED FOR NOW
        nblyr     = NBGCLYR   , & ! number of bio/brine layers per category
                                  ! maximum number of biology tracers + aerosols
                                  ! *** add to kscavz in icepack_zbgc_shared.F90
        n_bgc     = (n_algae*2 + n_doc + n_dic + n_don + n_fed + n_fep + n_zaero &
                  + 8)        , & ! nit, am, sil, dmspp, dmspd, dms, pon, humic
        nltrcr    = (n_bgc*TRBGCZ+TRZS)*TRBRI, & ! number of zbgc (includes zaero)
                                                 ! and zsalinity tracers
        max_nsw   = (nilyr+nslyr+2) & ! total chlorophyll plus aerosols
                  * (1+TRZAERO),& ! number of tracers active in shortwave calculation
        max_ntrcr =   1         & ! 1 = surface temperature
                  + nilyr       & ! ice salinity
                  + nilyr       & ! ice enthalpy
                  + nslyr       & ! snow enthalpy
                              !!!!! optional tracers:
                  + nfsd        & ! number of floe size categories
                  + TRAGE       & ! age
                  + TRFY        & ! first-year area
                  + TRLVL*2     & ! level/deformed ice
                  + TRPND*3     & ! ponds
                  + TRSNOW*4*nslyr & ! snow redistribution/metamorphism
                  + n_iso*2     & ! number of isotopes (in ice and snow)
                  + n_aero*4    & ! number of aerosols * 4 aero layers
                  + TRBRI       & ! brine height
                  + TRBGCS*n_bgc           & ! skeletal layer BGC
                  + TRZS  *TRBRI* nblyr    & ! zsalinity  (off if TRBRI=0)
                  + n_bgc*TRBGCZ*TRBRI*(nblyr+3) & ! zbgc (off if TRBRI=0)
                  + n_bgc*TRBGCZ           & ! mobile/stationary phase tracer
                  + 1             ! for unused tracer flags

!=======================================================================

      end module icedrv_domain_size

!=======================================================================
