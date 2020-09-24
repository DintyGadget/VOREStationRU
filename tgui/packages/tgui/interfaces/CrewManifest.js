import { useBackend } from "../backend";
import { Box, Section, Table } from "../components";
import { Window } from "../layouts";
import { COLORS } from "../constants";

/*
 * Shared by the following templates (and used individually too)
 * - Communicator.js
 * - IdentificationComputer.js
 * - pda/pda_manifest.js
 * In order to fuel this UI, you must use the following code in your ui_data (or static data, doesn't really matter)
 * ```dm
if(data_core)
    data_core.get_manifest_list()
data["manifest"] = PDA_Manifest
 * ```
 */

export const CrewManifest = (props, context) => {
  return (
    <Window width={400} height={600}>
      <Window.Content scrollable>
        <CrewManifestContent />
      </Window.Content>
    </Window>
  );
};

export const CrewManifestContent = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    manifest,
  } = data;

  return (
    <Section title="Манифест экипажа" noTopPadding>
      {manifest.map(cat => !!cat.elems.length && (
        <Section
          title={(
            <Box backgroundColor={COLORS.manifest[cat.cat.toLowerCase()]} m={-1} pt={1} pb={1}>
              <Box ml={1} textAlign="center" fontSize={1.4}>
                {cat.cat}
              </Box>
            </Box>
          )}
          key={cat.cat}
          level={2}>
          <Table>
            <Table.Row header color="white">
              <Table.Cell>Ф.И</Table.Cell>
              <Table.Cell>Должность</Table.Cell>
              <Table.Cell>Активность</Table.Cell>
            </Table.Row>
            {cat.elems.map(person => (
              <Table.Row color="average" key={person.name + person.rank}>
                <Table.Cell>{person.name}</Table.Cell>
                <Table.Cell>{person.rank}</Table.Cell>
                <Table.Cell>{person.active}</Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>
      ))}
    </Section>
  );
};