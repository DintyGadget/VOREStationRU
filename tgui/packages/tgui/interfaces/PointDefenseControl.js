import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Table, AnimatedNumber } from "../components";
import { Window } from "../layouts";

export const PointDefenseControl = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    id,
    turrets,
  } = data;
  return (
    <Window width={400} height={600}>
      <Window.Content scrollable>
        <Section title={"Базовый блок огневой поддержки: " + (id || "[no tag]")}>
          {turrets.length && turrets.map(pd => (
            <Section level={2} title={pd.id} key={pd.id} buttons={
              <Button
                selected={pd.active}
                icon="power-off"
                onClick={() => act("toggle_active", { target: pd.ref })}>
                {pd.active ? "Включен" : "Выключен"}
              </Button>
            }>
              <LabeledList>
                <LabeledList.Item label="Рабочий диапазон">
                  {pd.effective_range}
                </LabeledList.Item>
                <LabeledList.Item label="Задержка колеса реакции">
                  {pd.reaction_wheel_delay}
                </LabeledList.Item>
                <LabeledList.Item label="Время перезарядки">
                  {pd.recharge_time}
                </LabeledList.Item>
              </LabeledList>
            </Section>
          )) || (
            <Box color="bad">
              Ошибка: системы вооружения не обнаружены. Пожалуйста, проверьте сетевое соединение.
            </Box>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};