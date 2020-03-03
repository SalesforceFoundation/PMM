# pmdm

Program Management Data Model package for non-profit organizations.

## Development

Use the following commands to create a PMDM scratch org with or without the following options:
- PMDM only: `cci flow run dev_org --org dev`
- PMDM namespaced only: `cci flow run dev_org_namespaced --org dev_namespaced`
- PMDM + NPSP: `cci flow run dev_org --org npsp`
- PMDM namespaced + NPSP: `cci flow run dev_org_namespaced --org npsp_namespaced`

# Code Formatting

We are in trial to use [prettier](https://prettier.io/docs/en/cli.html) and [prettier-plugin-apex](https://github.com/dangmai/prettier-plugin-apex) to format our `classes`, `lwc`, and `aura`.

## [**Why Prettier?**](https://prettier.io/docs/en/why-prettier.html)

> By far the biggest reason for adopting Prettier is to stop all the on-going debates over styles. [It is generally accepted that having a common style guide is valuable for a project and team](https://www.smashingmagazine.com/2012/10/why-coding-style-matters/) but getting there is a very painful and unrewarding process. People get very emotional around particular ways of writing code and nobody likes spending time writing and receiving nits.
>
> So why choose the "Prettier style guide" over any other random style guide? Because Prettier is the only "style guide" that is fully automatic. Even if Prettier does not format all code 100% the way you'd like, it's worth the "sacrifice" given the unique benefits of Prettier, don't you think?

Plus, check out Prettier's [Option Philosophy](https://prettier.io/docs/en/option-philosophy.html) and [Rationale](https://prettier.io/docs/en/rationale.html).

## How to install `prettier` and `prettier-plugin-apex`

1. [Install `yarn`](https://yarnpkg.com/lang/en/docs/install/#mac-stable)
  > Installing [yarn](https://yarnpkg.com/) with [brew](https://brew.sh/) is recommended: `brew install yarn`
2. Call `yarn install` in the terminal.
  > See [yarn install documentation](https://yarnpkg.com/lang/en/docs/cli/install/) for more options.  For example, calling `yarn install --check-files` verifies that already installed files in `node_modules` did not get removed.

And that's it! :tada:

Behind the scenes the following packages are also installed:

- [eslint](https://eslint.org/): JavaScript linting
- [babel-eslint](https://github.com/babel/babel-eslint): JavaScript linting
- [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier): eslint with prettier
- [eslint-plugin-prettier](https://github.com/prettier/eslint-plugin-prettier): eslint with prettier
- [@lwc/eslint-plugin-lwc](https://github.com/salesforce/eslint-plugin-lwc): eslint for lwc
- [@salesforce/eslint-config-lwc](https://github.com/salesforce/eslint-config-lwc): eslint for lwc
- [@salesforce/sfdx-lwc-jest](https://github.com/salesforce/sfdx-lwc-jest): lwc [jest](https://jestjs.io/) tests

## How to use `prettier` and `prettier-plugin-apex`

Our (very few) prettier configurations are stored in `.prettierrc.yml`. tl;dr:
   - Our [print width](https://prettier.io/docs/en/rationale.html#print-width) is `90`: not too big, not too small.
   - We want to use `prettier-plugin-apex` to format Apex Classes, Trigger, and Execute Anonymous Scripts.
   - Use the correct, associated prettier parser for our `lwc`, `aura`, `classes`, and `*.apex` Execute Anonymous `scripts`.

[Use the prettier CLI](https://prettier.io/docs/en/cli.html).
   - Call `prettier --write path/to/**/*.{cls,apex,js,html}` to format the files specified in the path.
   - Call `prettier --check path/to/**/*.{cls,apex,js,html}` to check if the files specified in the path will change if formatted.
   - Call `prettier --debug-check path/to/**/*.{cls,apex,js,html}` to check if formatting will change the correctness of the files specified in the path.

## [Ignoring Code](https://prettier.io/docs/en/ignore.html)

Prettier offers an escape hatch to ignore a block of code or prevent entire files from being formatted.

### Ignoring Files
To exclude files from formatting, add entries to a `.prettierignore` file in the project root or set the [`--ignore-path` CLI option](https://prettier.io/docs/en/cli.html#ignore-path). `.prettierignore` uses [gitignore](https://git-scm.com/docs/gitignore#_pattern_format) syntax.

### JavaScript
A JavaScript comment of `// prettier-ignore` will exclude the next node in the abstract syntax tree from formatting.

For example:
```javascript
matrix(
  1, 0, 0,
  0, 1, 0,
  0, 0, 1
)

// prettier-ignore
matrix(
  1, 0, 0,
  0, 1, 0,
  0, 0, 1
)
```
will be transformed to:
```javascript
matrix(1, 0, 0, 0, 1, 0, 0, 0, 1);

// prettier-ignore
matrix(
  1, 0, 0,
  0, 1, 0,
  0, 0, 1
)
```

### JSX (e.g. LWC)
```html
<div>
  {/* prettier-ignore */}
  <span     ugly  format=''   />
</div>
```

### HTML
```html
<!-- prettier-ignore -->
<div         class="x"       >hello world</div            >

<!-- prettier-ignore-attribute -->
<div
  (mousedown)="       onStart    (    )         "
  (mouseup)="         onEnd      (    )         "
></div>

<!-- prettier-ignore-attribute (mouseup) -->
<div
  (mousedown)="onStart()"
  (mouseup)="         onEnd      (    )         "
></div>
```

### CSS
```css
/* prettier-ignore */
.my    ugly rule
{

}
```

### Markdown
```md
<!-- prettier-ignore -->
Do   not    format   this
```

## Can I automatically format files every time I save in my text editor?

Probably. :thumbsup:

See the instructions below. Please contribute how you automatically format files with `prettier` every time you save a file in your text editor.
 
### VS Code

1. Install the [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) VS Code Extension.
2. Change the **Editor: Default Formatter** to `esbenp.prettier-vscode`
   - Or add `"editor.defaultFormatter": "esbenp.prettier-vscode"` to your `settings.json`
3. Check **Editor: Format On Save**
   - Or add `"editor.formatOnSave": true` to your `settings.json`
4. Prettifying files can take ~1 s. Update **Editor: Format On Save Timeout** to `2000`.
   - Or add `"editor.formatOnSaveTimeout": 5000` to your `settings.json`
   - If you notice files not formatting after saving, try increasing upir **Editor: Format On Save Timeout**. Maybe, `prettier` is completing before timing out.
5. Save a file. :bowtie:. Our prettier configuration at `.prettierrc.yml` should be honored.

#### Bonuses
- Even though we've configured VS Code to format each file upon save, there is a VS Code command if you want to save a file without formatting.   Press <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> to search for commands, then search for `Files: Save without Formatting`.

#### Troubleshooting
If you are trying to call command `Format Document` an Apex Class in VS Code but get an error similar to "parser not found", try the following:
-  In the terminal, call `yarn install --check-files`.  Yarn will make sure `node_modules` contains the necessary files.
-  Quit VS Code and restart for VS Code to refresh it's configuration and our `.prettierrc.yml` configuration.

#### Apex Anonymous woes

When trying the <kbd>Format Document</kbd> command on an **Apex Anonymous** file, e.g. `scripts/*.apex`, I get an error:

> There is no formatter for 'apex-anon'-files installed.

I can't figure out how to associate **Apex Anonymous** (`apex-anon`) files with the `esbenp.prettier-vscode` formatter, i.e. update `settings.json` with

```json
"[apex-anon]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": true
}
```

**Workarounds**

- Use the command line: `prettier --write scripts/[file name].apex`
- In VS Code, change the file format to **Apex** (which will give linting errors), execute <kbd>Format Document</kbd> which honors our `.prettierrc.yml` to prettify with `apexAnonymous: true`, then change the file format back to **Apex Anonymous**.

**Attempt to associate Apex Anonymous (`apex-anon`) with a formatter in `settings.json`**

### IntelliJ

The Salesforce-focused plugin for IntelliJ called Illuminated Cloud has its own code formatting tools, but to keep consistency with other IDEs, we will use the separate IntelliJ plugin for Prettier.
[Initial setup instructions to install the plugin are here.](https://www.jetbrains.com/help/idea/prettier.html)

If you've followed the initial setup steps above, the Prettier application is in `/node_modules/prettier` within your local repo directory.

To **manually** apply rules to a file, press ⇧⌥⌘P.

To **auto-apply rules on save**, first install the File Watchers plugin. Then follow [these instructions](https://www.jetbrains.com/help/idea/using-file-watchers.html#ws_creating_file_watchers) to create two File Watcher configs using the Prettier template, one for Apex Classes files and one for Javascript files.
