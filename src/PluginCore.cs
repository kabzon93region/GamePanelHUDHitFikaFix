using System;
using System.Reflection;
using BepInEx;
using HarmonyLib;

namespace GamePanelHUDHitFikaFix
{
    [BepInPlugin(PluginInfo.GUID, PluginInfo.NAME, PluginInfo.VERSION)]
    [BepInDependency("com.kmyuhkyuk.GamePanelHUDHit", "3.4.0")]
    [BepInDependency("com.kmyuhkyuk.KmyTarkovApi", "1.5.0")]
    public class PluginCore : BaseUnityPlugin
    {
        private const string ObservedPlayerTypeName = "Fika.Core.Main.Players.ObservedPlayer";
        private const string HitPluginTypeName = "GamePanelHUDHit.GamePanelHUDHitPlugin";
        private const string CoopApplyShotMethodName = "CoopApplyShot";

        private Harmony _harmony;

        private void Awake()
        {
            _harmony = new Harmony(PluginInfo.GUID);

            if (!TryPatchObservedApplyClientShot())
            {
                Logger.LogWarning("[HIT_FIKA_FIX] ObservedPlayer.ApplyClientShot patch was not applied");
            }
        }

        private bool TryPatchObservedApplyClientShot()
        {
            var observedPlayerType = AccessTools.TypeByName(ObservedPlayerTypeName);
            if (observedPlayerType == null)
            {
                Logger.LogInfo("[HIT_FIKA_FIX] Fika not loaded, patch skipped");
                return false;
            }

            var targetMethod = AccessTools.Method(observedPlayerType, "ApplyClientShot");
            if (targetMethod == null)
            {
                Logger.LogError("[HIT_FIKA_FIX] ObservedPlayer.ApplyClientShot not found");
                return false;
            }

            if (IsAlreadyPatched(targetMethod))
            {
                Logger.LogInfo("[HIT_FIKA_FIX] ObservedPlayer.ApplyClientShot already patched");
                return true;
            }

            var hitPluginType = AccessTools.TypeByName(HitPluginTypeName);
            if (hitPluginType == null)
            {
                Logger.LogError("[HIT_FIKA_FIX] GamePanelHUDHit plugin type not found");
                return false;
            }

            var coopApplyShot = FindCoopApplyShotMethod(hitPluginType);
            if (coopApplyShot == null)
            {
                Logger.LogError("[HIT_FIKA_FIX] GamePanelHUDHit CoopApplyShot not found");
                return false;
            }

            _harmony.Patch(targetMethod, postfix: new HarmonyMethod(coopApplyShot));
            Logger.LogInfo("[HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot -> GamePanelHUDHit.CoopApplyShot");
            return true;
        }

        private static MethodInfo FindCoopApplyShotMethod(Type hitPluginType)
        {
            foreach (var method in hitPluginType.GetMethods(BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public))
            {
                if (method.Name != CoopApplyShotMethodName)
                {
                    continue;
                }

                var parameters = method.GetParameters();
                if (parameters.Length != 4)
                {
                    continue;
                }

                return method;
            }

            return null;
        }

        private static bool IsAlreadyPatched(MethodBase targetMethod)
        {
            var patchInfo = Harmony.GetPatchInfo(targetMethod);
            if (patchInfo?.Postfixes == null || patchInfo.Postfixes.Count == 0)
            {
                return false;
            }

            foreach (var patch in patchInfo.Postfixes)
            {
                if (patch.PatchMethod?.DeclaringType?.FullName?.Contains("GamePanelHUDHit") == true)
                {
                    return true;
                }

                if (patch.PatchMethod?.DeclaringType?.FullName?.Contains(nameof(GamePanelHUDHitFikaFix)) == true)
                {
                    return true;
                }
            }

            return false;
        }
    }
}
