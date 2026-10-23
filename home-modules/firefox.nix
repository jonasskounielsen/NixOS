{ pkgs, config, ...}:
# From https://github.com/nutria-official/nixos/commit/71df6e637353f3ac77b48f4998072e4dcf1166c3
{
  programs.firefox = {
    enable = true;
    configPath = "${config.home.homeDirectory}/.mozilla/firefox";
    policies = {
      AIChatbot = {
        Providers = {
          Add = [ 
            {
              url = "https://lumo.proton.me/";
              name = "Lumo";
              id = "Lumo";
              iconUrl = builtins.fetchurl {
                url = "https://upload.wikimedia.org/wikipedia/commons/f/f0/Proton_Lumo_Alert.svg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original";
                name = "Proton_Lumo_Alert.svg";
                sha256 = "15fgabcglislpr866swlzlylfssr1z8lq5wb5i6fv0788lx3b5nq";
              };
              queryParam = "q";
            }
          ];
          Builtin = {
            "Anthropic Claude" = true;
            "ChatGPT" = true;
            "Copilot" = true;
            "Google Gemini" = true;
            "HuggingChat" = true;
            "Le Chat Mistral" = true;
            "localhost" = true;
          };
          Default = "Lumo"; 
        };
        Prompts = {
          Enabled = true;
          BuiltIn = {
            Summarize = true;
            Explain = true;
            Quiz = true;
            Proofread = true;
          };
        };
      };
      AIControls = {
        Default = {
          Value = "blocked";
          Locked = true;
        };
        SidebarChatbot = {
          Value = "available";
          Locked = true;
        };
        Translations = {
          Value = "available";
          Locked = false;
        };
      };
      AllowFileSelectionDialogs = true;
      AppAutoUpdate = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BackgroundAppUpdate = false;
      BlockAboutAddons = false;
      BlockAboutConfig = false;
      BlockAboutProfiles = false;
      BlockAboutSupport = false;
      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };
      CaptivePortal = true;
      ClearOnShutdown = {
        BrowsingHistoryAndDownloads = false;
        CookiesAndStorage = false;
        Cache = true;
        FormData = true;
        SiteSettings = false;
        Exceptions = [
        ];
      };
      CNSA2KeyAgreementEnabled = false;
      Containers = {
        Default = [
        ];
      };
      ContentAnalysis = {
        Enabled = false;
      };
      ContentAnalysisTelemetry = {
        Enabled = false;
      };
      Cookies = {
        Behavior = "partition-foreign";
        Locked = true;
      };
      CrashReportsSubmit = false;
      DefaultBrowserSettingEnabled = false;
      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
      DefaultSerialGuardSetting = 2;
      DisableAccounts = false;
      DisableAppUpdate = true;
      DisableBuiltinPDFViewer = false;
      DisabledCiphers = false;
      DisableDefaultBrowserAgent = true;
      DisableDeveloperTools = false;
      DisableEncryptedClientHello = false;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = false;
      DisableFirefoxScreenshots = false;
      DisableFirefoxStudies = true;
      DisableForgetButton = false;
      DisableFormHistory = true;
      DisableLaunchOnLogin = true;
      DisableLocalPolicies = false;
      DisableMasterPasswordCreation = true;
      DisablePasswordReveal = true;
      DisableProfileImport = false;
      DisableProfileRefresh = false;
      DisableRemoteImprovements = false;
      DisableRemoteSettingsAndAcceptSecurityConsequences = false;
      DisableSafeMode = false;
      DisableSecurityBypass = "InvalidCertificate";
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = false;
      DisableTelemetry = true;
      DisableThirdPartyModuleBlocking = true;
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "default-off";
      DNSOverHTTPS = {
        Enabled = true;
        Locked = true;
        Fallback = false;
      };
      DontCheckDefaultBrowser = true;
      DownloadDirectory = "${config.home.homeDirectory}/Downloads";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Category = "strict";
        BaselineExceptions = false;
        ConvenienceExceptions = false;
      };
      EncryptedMediaExtensions = {
        Enabled = false;
        Locked = true;
      };
      ExtensionSettings = let 
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*" = {
          installation_mode = "blocked";
          blocked_install_message = "Nej.";
        };
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = moz "ublock-origin";
          updates_disabled = true;
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url = moz "bitwarden-password-manager";
          updates_disabled = true;
          private_browsing = true;
        };
        "authenticator@mymindstorm" = {
          installation_mode = "force_installed";
          install_url = moz "auth-helper";
          updates_disabled = true;
          private_browsing = true;
        };
        "private-relay@firefox.com" = {
          installation_mode = "force_installed";
          install_url = moz "private-relay";
          updates_disabled = true;
          private_browsing = true;
        };
        "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = {
          installation_mode = "force_installed";
          install_url = moz "view-page-archive";
          updates_disabled = true;
          private_browsing = true;
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "force_installed";
          install_url = moz "vimium-ff";
          updates_disabled = true;
          private_browsing = true;
        };
        "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = {
          installation_mode = "force_installed";
          install_url = moz "indie-wiki-buddy";
          updates_disabled = true;
          private_browsing = true;
        };
        "{75afe46a-7a50-4c6b-b866-c43a1075b071}" = {
          installation_mode = "force_installed";
          install_url = moz "user-agent-switcher-revived";
          updates_disabled = true;
          private_browsing = true;
        };
        "{b5501fd1-7084-45c5-9aa6-567c2fcf5dc6}" = {
          installation_mode = "force_installed";
          install_url = moz "ruffle-rs";
          updates_disabled = true;
          private_browsing = true;
        };
        "oii-plus@yaetrna.dev" = {
          installation_mode = "force_installed";
          install_url = moz "osu-improvement-indicator-plus";
          updates_disabled = true;
          private_browsing = true;
        };
        "claymont@mail.com_detach-tab" = {
          installation_mode = "force_installed";
          install_url = moz "detach-tab";
          updates_disabled = true;
          private_browsing = true;
        };
        "zotero@chnm.gmu.edu" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/zotero-connector/latest.xpi";
          updates_disabled = true;
          private_browsing = true;
        };
      };
      ExtensionUpdate = true;
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Widgets = {
          Enabled = true;
          Blocked = [
            "clocks"
            "crossword"
            "focusTimer"
            "lists"
            "pictureOfTheDay"
            "privacy"
            "recentSearches"
            "sportsWidget"
            "stocks"
            "weather"
          ];
        };
        Locked = true;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        OnlineEnabled = false;
        Locked = true;
      };
      GenerativeAI = {
        Enabled = false;
        Chatbot = true;
        Locked = true;
      };
      GoToIntranetSiteForSingleWordEntryInAddressBar = false;
      HardwareAcceleration = true;
      Homepage = {
        Locked = true;
        StartPage = "previous-session";
        NewTabOnRestore = false;
      };
      HttpsOnlyMode = "enabled";
      InstallAddonsPermission = {
        Default = true;
      };
      IPProtectionAvailable = false;
      LegacyProfiles = false;
      LegacySameSiteCookieBehaviorEnabled = false;
      LocalNetworkAccess = {
        Enabled = true;
        BlockTrackers = true;
        EnablePrompting = true;
        Locked = true;
      };
      ManualAppUpdateOnly = false;
      MicrosoftEntraSSO = false;
      NetworkPrediction = true;
      NewTabPage = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      OverrideFirstRunPage = "";
      PasswordManagerEnabled = false;
      PDFjs = {
        Enabled = true;
        EnablePermissions = false;
      };
      PictureInPicture = {
        Enabled = false;
        Locked = true;
      };
      PopupBlocking = {
        Default = false;
        Locked = true;
      };
      PostQuantumKeyAgreementEnabled = true;
      Preferences = {
        "privacy.fingerprintingProtection" = true;
      };
      PrimaryPassword = false;
      PrintingEnabled = true;
      PrivateBrowsingModeAvailability = 0;
      PromptForDownloadLocation = true;
      Proxy = {
        Locked = true;
      };
      RequestedLocales = [ "en-US" "da" ];
      SearchBar = "separate";
      SearchEngines = {
        Default = "ddg";
        PreventInstalls = true;
        Remove = [ "Google" "Bing" "Perplexity"];
      };
      SearchSuggestEnabled = true;
      ShowHomeButton = false;
      SitePolicies = [
        {
          Match = [
            "*.google.com"
            "*.youtube.com"
          ];
          Policies = {
            Container = {
              id = "google";
              ephemeral = false;
            };
          };
        }
        {
          Match = [
            "*.microsoft.com"
            "*.live.com"
            "*.outlook.com"
            "*.windows.com"
            "*.office.com"
            "*.teams.com"
            "*.cloud.microsoft"
            "*.sharepoint.com"
          ];
          Policies = {
            Container = {
              id = "microsoft";
              ephemeral = false;
            };
          };
        }
      ];
      SkipTermsOfUse = true;
      StartDownloadsInTempDirectory = true;
      Sync = {
        Addons = true;
        Addresses = true;
        Bookmarks = true;
        Enabled = true;
        History = true;
        OpenTabs = false;
        Passwords = false;
        PaymentMethods = false;
        Locked = true;
      };
      TranslateEnabled = true;
      UserMessaging = {
        ExtensionRecommendations = true;
        FeatureRecommendations = true;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
      UseSystemPrintDialog = false;
      VisualSearchEnabled = true;
      WindowsSSO = false;
      XSLTEnabled = true;
    };

    profiles = {
      default = {
        isDefault = true;
        name = "default";
        path = "default";
        id = 0;
        search = {
          force = true;
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "query";   value = "{searchTerms}"; }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "query";   value = "{searchTerms}"; }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };
           "WolframAlpha" = {
             urls = [
               {
                 template = "https://www.wolframalpha.com/input";
                 params = [
                   { name = "i"; value = "{searchTerms}"; }
                 ];
               }
             ];
             icon = builtins.fetchurl {
               url = "https://upload.wikimedia.org/wikipedia/commons/e/e3/Wolfram_Alpha_2022.svg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original";
               name = "Wolfram_Alpha_2022.svg";
               sha256 = "1d1376yiibyng93gahgjs9fw052hll81i5m0ds7dpri291k3s5ih";
             };
             definedAliases = [ "@wa" ];
           };
          };
        };
      };
    };
  };
}
