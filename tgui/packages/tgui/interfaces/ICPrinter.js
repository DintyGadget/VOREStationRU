import { round } from 'common/math';
import { Fragment } from 'inferno';
import { useBackend, useSharedState } from "../backend";
import { Box, Button, Flex, Icon, LabeledList, ProgressBar, Section, Divider, Tabs } from "../components";
import { Window } from "../layouts";
import { sortBy, filter } from 'common/collections';
import { logger } from '../logging';

export const ICPrinter = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    metal,
    max_metal,
    metal_per_sheet,
    debug,
    upgraded,
    can_clone,
    assembly_to_clone,
    categories,
  } = data;

  return (
    <Window width={500} height={630}>
      <Window.Content scrollable>
        <Section title="Status">
          <LabeledList>
            <LabeledList.Item label="Метал">
              <ProgressBar
                value={metal}
                maxValue={max_metal}>
                {metal / metal_per_sheet} / {max_metal / metal_per_sheet} sheets
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Доступные Схемы">
              {upgraded ? "Расширенные" : "Обычные"}
            </LabeledList.Item>
            <LabeledList.Item label="Клонирование Сборки">
              {can_clone ? "Доступно" : "Недоступно"}
            </LabeledList.Item>
          </LabeledList>
          <Box mt={1}>
            Примечание: красное имя компонента означает, что принтер должен быть обновлен для создания этого компонента.
          </Box>
        </Section>
        <ICPrinterCategories />
        
      </Window.Content>
    </Window>
  );
};

const canBuild = (item, data) => {
  if (!item.can_build) {
    return false;
  }

  if (item.cost > data.metal) {
    return false;
  }

  return true;
};

const ICPrinterCategories = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    categories,
    debug,
  } = data;

  const [categoryTarget, setcategoryTarget] = useSharedState(context, "categoryTarget", null);

  const selectedCategory = filter(cat => cat.name === categoryTarget)(categories)[0];

  return (
    <Section title="Схемы">
      <Tabs>
        {sortBy(cat => cat.name)(categories).map(cat => (
          <Tabs.Tab
            selected={categoryTarget === cat.name}
            onClick={() => setcategoryTarget(cat.name)}
            key={cat.name}>
            {cat.name}
          </Tabs.Tab>
        ))}
      </Tabs>
      {selectedCategory && (
        <Section title={selectedCategory.name} level={2}>
          <LabeledList>
            {sortBy(item => item.name)(selectedCategory.items).map(item => (
              <LabeledList.Item
                key={item.name}
                label={item.name}
                labelColor={item.can_build ? "good" : "bad"}
                buttons={
                  <Button
                    disabled={!canBuild(item, data)}
                    icon="print"
                    onClick={() => act("build", { build: item.path })}>
                    Печать
                  </Button>
                }>
                {item.desc}
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>
      ) || "Категория не выбрана."}
    </Section>
  );
};